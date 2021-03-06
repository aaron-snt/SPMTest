// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMTest",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Auth",
            targets: ["Auth"]),
        .library(
            name: "User",
            targets: ["User"]),

        .library(
            name: "Friend",
            targets: ["DynamicFriendFramework"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Alamofire", url: "https://github.com/Alamofire/Alamofire.git", from: "5.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Auth",
            dependencies: [
                .byName(name: "Alamofire")
            ]
        ),
        .target(
            name: "User",
            dependencies: [
                .target(name: "Auth")
            ]
        ),
        .binaryTarget(
            name: "DynamicFriendFramework",
            path: "DynamicFriend.xcframework"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
