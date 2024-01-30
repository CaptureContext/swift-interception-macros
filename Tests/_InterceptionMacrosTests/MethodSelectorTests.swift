import XCTest
import MacroTesting
import _SwiftInterceptionCustomSelectorsMacros

final class MethodSelectorTests: XCTestCase {
	override func invokeTest() {
		withMacroTesting(
			isRecording: false,
			macros: [
				"methodSelector": MethodSelectorMacro.self
			]
		) {
			super.invokeTest()
		}
	}

	func testApplication() {
		assertMacro {
			"""
			#methodSelector(Object.someFunc)
			"""
		} expansion: {
			"""
			_makeMethodSelector(
				selector: #selector(Object.someFunc),
				signature: Object.someFunc
			)
			"""
		}
	}
}
