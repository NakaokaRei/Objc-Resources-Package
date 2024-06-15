// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Objc-Resources-Package",
    products: [
        .library(
            name: "Objc-Resources-Package",
            targets: ["Objc-Resources-Package"]),
    ],
    targets: [
        .target(
            name: "Objc-Resources-Package",
            resources: [.copy("foo.txt")]
        ),
        .testTarget(
            name: "Objc-Resources-PackageTests",
            dependencies: ["Objc-Resources-Package"]),
    ]
)
