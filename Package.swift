// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SkeletonView",
    products: [
        .library(
            name: "SkeletonView",
            targets: ["SkeletonView"]),
    ],
    targets: [
        .target(
            name: "SkeletonView",
            dependencies: []),
        .testTarget(
            name: "SkeletonViewTests",
            dependencies: ["SkeletonView"]),
    ]
)
