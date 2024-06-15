## What is this repository for?
This repository is for representing the bug that occurs when accessing the resource bundle of Objective-C Target of Swift Package. This bug has been reported at below.
https://forums.swift.org/t/package-with-in-name-has-in-bundle-name-in-resource-bundle-accessor-m-for-obj-c-target/56246

## How to reproduce the bug?
This bug happen in the case of running the test target from Xcode or `xcodebuild` command in the terminal. In the case of runing `swift test` command, it works fine.

1. Clone this repository.
2. Open Package.swift with Xcode.
3. Run the Objc-Resources-Package test target. Or run the below command in the terminal.
```
xcodebuild -scheme Objc-Resources-Package test -destination "name=My Mac"| xcpretty
```