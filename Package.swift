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
        ),
        .library(
            name: "SkeletonView-Dynamic",
            type: .dynamic,
            targets: ["SkeletonView"]
        )
    ],
    targets: [
        .target(
            name: "SkeletonView",
            path: "SkeletonViewCore/Sources",
            resources: [.copy("Supporting Files/PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "SkeletonViewTests",
            dependencies: ["SkeletonView"],
            path: "SkeletonViewCore/Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
