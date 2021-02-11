// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SkeletonView",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "SkeletonView",
            targets: ["SkeletonView"]
        )
    ],
    dependencies: [
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .exact("1.8.2"))
    ],
    targets: [
        .target(
            name: "SkeletonView",
            path: "Sources",
            exclude: [
                "*.md"
            ]
        ),
        .testTarget(
            name: "SkeletonViewTests",
            dependencies: [
                "SkeletonView",
                "SnapshotTesting"
            ],
            path: "Tests/SkeletonViewTests",
            exclude: [
                "UI/__Snapshots__"
            ]
        )
    ]
)
