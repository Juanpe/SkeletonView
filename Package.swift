// swift-tools-version:5.0

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
            targets: ["SkeletonView"])
	],
	targets: [
		.target(
			name: "SkeletonView",
			dependencies: [],
			path: "Sources")
	],
	swiftLanguageVersions: [.v5]
)
