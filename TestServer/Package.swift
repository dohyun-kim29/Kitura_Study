// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestServer",
    dependencies: [
        
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.9.1"),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.0"),
        .package(url: "https://github.com/IBM-Swift/FileKit.git", from: "0.0.2")
        
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TestServer",
            dependencies: ["Kitura", "HeliumLogger", "FileKit"]),
        .testTarget(
            name: "TestServerTests",
            dependencies: ["TestServer"]),
    ]
)
