// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "SkeletonView",
    products: [
        .library(name: "SkeletonView", targets: ["SkeletonView"])
    ],
    targets: [
        .target(
            name: "SkeletonView",
            path: "Sources"
        )
    ]
)
