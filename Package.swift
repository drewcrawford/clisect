// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "clisect",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
    ],
    targets: [
        .target(
            name: "clisect",
            dependencies: [
                .target(name: "clisectkit"),
            ]),
        .testTarget(
            name: "clisectTests",
            dependencies: ["clisect"]),
        .target(
            name: "clisectkit",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(name: "clisectkitTests",
                    dependencies: [.target(name: "clisectkit")]),

    ]
)
