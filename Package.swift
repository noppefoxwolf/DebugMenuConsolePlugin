// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DebugMenuConsolePlugin",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "DebugMenuConsolePlugin",
            targets: ["DebugMenuConsolePlugin"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-log.git",
            from: "1.4.1"
        ),
        .package(
            url: "https://github.com/noppefoxwolf/DebugMenu.git",
//            from: "1.10.0"
            .branch("release/1.10.0")
        )
    ],
    targets: [
        .target(
            name: "DebugMenuConsolePlugin",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "DebugMenu", package: "DebugMenu")
            ]),
        .testTarget(
            name: "DebugMenuConsolePluginTests",
            dependencies: ["DebugMenuConsolePlugin"]),
    ]
)
