// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "APDynamicGrid",
	platforms: [.iOS(.v14)],
	products: [
		.library(
			name: "APDynamicGrid",
			targets: ["APDynamicGrid"]),
	],
    dependencies: [],
    targets: [
		.target(
			name: "APDynamicGrid",
			dependencies: []),
		.testTarget(
			name: "APDynamicGridTests",
			dependencies: ["APDynamicGrid"]),
	], swiftLanguageVersions: [.v5]
)
