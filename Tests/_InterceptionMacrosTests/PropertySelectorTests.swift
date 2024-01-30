import XCTest
import MacroTesting
import _SwiftInterceptionCustomSelectorsMacros

final class PropertySelectorTests: XCTestCase {
	override func invokeTest() {
		withMacroTesting(
			isRecording: false,
			macros: [
				"propertySelector": PropertySelectorMacro.self
			]
		) {
			super.invokeTest()
		}
	}

	func testApplication() {
		assertMacro {
			#"""
			#propertySelector(\Object.someProperty)
			"""#
		} expansion: {
			#"""
			_unsafeMakePropertySelector(\Object.someProperty)
			"""#
		}
	}
}
