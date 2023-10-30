// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DPVersion",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "DPVersion",
            targets: ["DPVersion"]),
    ],
    targets: [
        .target(
            name: "DPVersion"),
        .testTarget(
            name: "DPVersionTests",
            dependencies: ["DPVersion"]),
    ]
)
