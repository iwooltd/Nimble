// swift-tools-version:5.1
import PackageDescription

let package = Package(
	name: "CwlPreconditionTesting",
	products: [
		.library(name: "CwlPreconditionTesting", type: .dynamic, targets: ["CwlPreconditionTesting", "CwlMachBadInstructionHandler"])
	],
	dependencies: [
		.package(url: "https://github.com/iwooltd/CwlCatchException.git", from: "1.2.0")
	],
	targets: [
		.target(
			name: "CwlPreconditionTesting",
			dependencies: [
				.target(name: "CwlMachBadInstructionHandler"),
				.product(name: "CwlCatchException")
			],
			exclude: [
				"./Mach/CwlPreconditionTesting.h",
				"./Posix/CwlPreconditionTesting.h",
				"./CwlCatchBadInstructionPosix.swift"
			]
		),
		.target(name: "CwlMachBadInstructionHandler"),
		.testTarget(name: "CwlPreconditionTestingTests", dependencies: ["CwlPreconditionTesting"])
	]
)
