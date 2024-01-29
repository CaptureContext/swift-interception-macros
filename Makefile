CONFIG = debug
PLATFORM_MACOS = macOS

default: test

test:
	$(MAKE) CONFIG=debug test-library

test-library:
		(xcodebuild test \
			-skipMacroValidation \
			-configuration $(CONFIG) \
			-workspace .github/package.xcworkspace \
			-scheme _InterceptionMacrosTests \
			-destination platform=macOS | xcpretty && exit 0 \
		) \
		|| exit 1;
