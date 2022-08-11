// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SkeletonView",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "SkeletonView",
            targets: ["SkeletonView"]
        )
    ],
    targets: [
        .target(
            name: "SkeletonView",
            path: "SkeletonViewCore/Sources"
        ),
        .binaryTarget(
            name: "SkeletonView-SPM",
            url: "https://cdn.juanpecatalan.com/SkeletonView.xcframework.zip",
            checksum: "c00e72efa25c0af3ae50646f5f969b0c511be4da6023f68154ece63a0c249b99"
        ),
        .testTarget(
            name: "SkeletonViewTests",
            dependencies: ["SkeletonView"],
            path: "SkeletonViewCore/Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
