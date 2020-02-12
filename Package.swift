// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GrayedBackgroundVC",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "GrayedBackgroundVC",
            targets: ["GrayedBackgroundVC"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "GrayedBackgroundVC",
            dependencies: []),
        .testTarget(
            name: "GrayedBackgroundVCTests",
            dependencies: ["GrayedBackgroundVC"]),
    ]
)
