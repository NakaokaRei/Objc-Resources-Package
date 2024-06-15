## What is this repository for?
This repository is for representing the bug that occurs when accessing the resource bundle of Objective-C Target of Swift Package. This bug has been reported at below.

https://forums.swift.org/t/package-with-in-name-has-in-bundle-name-in-resource-bundle-accessor-m-for-obj-c-target/56246

## How to reproduce the bug?
This bug happen in the case of running the test target from Xcode or `xcodebuild` command in the terminal. In the case of runing `swift test` command, it works fine.

1. Clone this repository.
2. Open Package.swift with Xcode.
3. Run the Objc-Resources-Package scheme. Or run the below command in the terminal.
```
xcodebuild -scheme Objc-Resources-Package test -destination "name=My Mac"| xcpretty
```

## Why this bug happens?
I guess this is because of the difference of generated `resource_bundle_accessor.m` between `swift test` and `xcodebuild` command. In the case of `swift test`, the generated `resource_bundle_accessor.m` is like below.

```objc
#import <Foundation/Foundation.h>

NSBundle* Objc_Resources_Package_SWIFTPM_MODULE_BUNDLE() {
    NSURL *bundleURL = [[[NSBundle mainBundle] bundleURL] URLByAppendingPathComponent:@"Objc-Resources-Package_Objc-Resources-Package.bundle"];

    NSBundle *preferredBundle = [NSBundle bundleWithURL:bundleURL];
    if (preferredBundle == nil) {
      return [NSBundle bundleWithPath:@"/Users/rei.nakaoka/work/dev/Objc-Resources-Package/.build/arm64-apple-macosx/debug/Objc-Resources-Package_Objc-Resources-Package.bundle"];
    }

    return preferredBundle;
}
```

In the case of `xcodebuild` command, the generated `resource_bundle_accessor.m` is like below.

```objc
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Objc_Resources_Package_Objc_Resources_Package_SWIFTPM_MODULE_BUNDLER_FINDER : NSObject
@end

@implementation Objc_Resources_Package_Objc_Resources_Package_SWIFTPM_MODULE_BUNDLER_FINDER
@end

NSBundle* Objc_Resources_Package_Objc_Resources_Package_SWIFTPM_MODULE_BUNDLE() {
    NSString *bundleName = @"Objc_Resources_Package_Objc_Resources_Package";

    NSArray<NSURL*> *candidates = @[
        NSBundle.mainBundle.resourceURL,
        [NSBundle bundleForClass:[Objc_Resources_Package_Objc_Resources_Package_SWIFTPM_MODULE_BUNDLER_FINDER class]].resourceURL,
        NSBundle.mainBundle.bundleURL
    ];

    for (NSURL* candiate in candidates) {
        NSURL *bundlePath = [candiate URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle", bundleName]];

        NSBundle *bundle = [NSBundle bundleWithURL:bundlePath];
        if (bundle != nil) {
            return bundle;
        }
    }

    @throw [[NSException alloc] initWithName:@"SwiftPMResourcesAccessor" reason:[NSString stringWithFormat:@"unable to find bundle named %@", bundleName] userInfo:nil];
}
