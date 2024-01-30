# Swift-interception-macros

[![SwiftPM 5.9](https://img.shields.io/badge/swiftpm-5.9-ED523F.svg?style=flat)](https://swift.org/download/) ![Platforms](https://img.shields.io/badge/Platforms-iOS_13_|_macOS_10.15_|_Catalyst_13_|_tvOS_13_|_watchOS_7-ED523F.svg?style=flat) [![@capturecontext](https://img.shields.io/badge/contact-@capturecontext-1DA1F2.svg?style=flat&logo=twitter)](https://twitter.com/capture_context) 

Macros extension for [`swift-interception`](https://github.com/capturecontext/swift-interception)

## Usage

Observe selectors on NSObject instances

```swift
import InterceptionMacros

navigationController.setInterceptionHandler(
  for: #methodSelector(UINavigationController.popViewController)
) { result in 
  print(result.args) // `animated` flag
  print(result.output) // popped `UIViewController?`
}
```

You can set up multiple interception handlers as well, just make sure that you use different keys for each handler

```swift
import InterceptionMacros

object.setInterceptionHandler(
  for: #methodSelector(MyObject.someMethod(arg1:arg2)),
  key: "argumentsPrinter"
) { result in 
  // In case of multiple arguments
  // you can access them as a tuple
  print(result.args.0)
  print(result.args.1)
}
```

## Installation

### Basic

You can add CombineInterception to an Xcode project by adding it as a package dependency.

1. From the **File** menu, select **Swift Packages › Add Package Dependency…**
2. Enter [`"https://github.com/capturecontext/swift-interception-macros.git"`](https://github.com/capturecontext/swift-interception-macros.git) into the package repository URL text field
3. Choose products you need to link them to your project.

### Recommended

If you use SwiftPM for your project, you can add CombineInterception to your package file.

```swift
.package(
  url: "https://github.com/capturecontext/swift-interception-macros.git", 
  .upToNextMinor(from: "0.2.0")
)
```

Do not forget about target dependencies:

```swift
.product(
  name: "InterceptionMacros",
  package: "swift-interception-macros"
)
```

## License

This library is released under the MIT license. See [LICENCE](LICENCE) for details.

See [ACKNOWLEDGMENTS](ACKNOWLEDGMENTS) for inspiration references and their licences.
