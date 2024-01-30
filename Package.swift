// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
	name: "swift-interception-macros",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.macCatalyst(.v13),
		.watchOS(.v6)
	],
	products: [
		.library(
			name: "InterceptionMacros",
			type: .static,
			targets: ["InterceptionMacros"]
		)
	],
	dependencies: [
		.package(
			url: "https://github.com/capturecontext/swift-interception.git",
			.upToNextMinor(from: "0.1.0")
		),
		.package(
			url: "https://github.com/stackotter/swift-macro-toolkit.git",
			.upToNextMinor(from: "0.3.0")
		),
		.package(
			url: "https://github.com/pointfreeco/swift-macro-testing.git",
			.upToNextMinor(from: "0.2.2")
		)
	],
	targets: [
		.macro(
			name: "_InterceptionMacros",
			dependencies: [
				.product(
					name: "MacroToolkit",
					package: "swift-macro-toolkit"
				)
			]
		),

		.target(
			name: "InterceptionMacros",
			dependencies: [
				.target(name: "_InterceptionMacros"),
				.product(name: "Interception", package: "swift-interception")
			]
		),

		.testTarget(
			name: "_InterceptionMacrosTests",
			dependencies: [
				.target(name: "_InterceptionMacros"),
				.product(name: "MacroTesting", package: "swift-macro-testing"),
			]
		)
	]
)
