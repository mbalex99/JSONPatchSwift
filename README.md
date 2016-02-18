# JSON Patch (RFC 6902) in Swift [![Build Status](https://travis-ci.org/EXXETA/JSONPatchSwift.svg?branch=master)](https://travis-ci.org/EXXETA/JSONPatchSwift) [![Coverage Status](https://coveralls.io/repos/github/EXXETA/JSONPatchSwift/badge.svg?branch=master)](https://coveralls.io/github/EXXETA/JSONPatchSwift?branch=master)

JSONPatchSwift is an implementation of JSONPatch (RFC 6902) in pure Swift. It uses [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) for JSON handling.


## Installation

### CocoaPods (iOS 9.0+, OS X 10.10+)
You can use [CocoaPods](http://cocoapods.org/) to install `JSONPatchSwift`by adding it to your `Podfile`:
```ruby
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
	pod 'JSONPatchSwift', :git => 'https://github.com/EXXETA/JSONPatchSwift.git'
end
```

Note that this requires CocoaPods version 36, and your iOS deployment target to be at least 9.0:

## Usage

### Initialization
```swift
import JSONPatchSwift
```

Using a String:
```swift
let jsonPatch = try? JPSJsonPatch("{ \"op\": \"add\", \"path\": \"/baz\", \"value\": \"qux\" }")
```

Or using a SwiftyJSON object:
```swift
let json = JSON(data: " { \"op\": \"add\", \"path\": \"/baz\", \"value\": \"qux\" } ".dataUsingEncoding(NSUTF8StringEncoding)!)
let jsonPatch = try? JPSJsonPatch(json)
```

### Apply it on a JSON
```swift
let json = JSON(data: " { \"foo\" : \"bar\" } ".dataUsingEncoding(NSUTF8StringEncoding)!)
let resultingJson = try? JPSJsonPatcher.applyPatch(jsonPatch, toJson: json)
```

### Supported Operations

The framework supports all operations described by RFC 6902. Until we (or you? - see "contributing") find the time to add a documentation for each operation, we kindly ask to use our extensive test suite to find examples:

- add operation: [JPSAddOperationTests.swift](https://github.com/EXXETA/JSONPatchSwift/blob/master/JsonPatchSwiftTests/JPSAddOperationTests.swift)
- copy operation: [JPSCopyOperationTests.swift](https://github.com/EXXETA/JSONPatchSwift/blob/master/JsonPatchSwiftTests/JPSCopyOperationTests.swift)
- move operation: [JPSMoveOperationTests.swift](https://github.com/EXXETA/JSONPatchSwift/blob/master/JsonPatchSwiftTests/JPSMoveOperationTests.swift)
- remove operation: [JPSRemoveOperationTests.swift](https://github.com/EXXETA/JSONPatchSwift/blob/master/JsonPatchSwiftTests/JPSRemoveOperationTests.swift)
- replace operation: [JPSReplaceOperationTests.swift](https://github.com/EXXETA/JSONPatchSwift/blob/master/JsonPatchSwiftTests/JPSReplaceOperationTest.swift)
- test operation: [JPSTestOperationTests.swift](https://github.com/EXXETA/JSONPatchSwift/blob/master/JsonPatchSwiftTests/JPSTestOperationTests.swift)

## Requirements

- iOS 9.0+
- Xcode 7


## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## History

- v1.2 - upgrade to 100% documented and 100% tested
- v1.1 - fixed a packaging problem
- v1.0 - initial release

## Credits

- EXXETA AG
- See [Contributors](https://www.github.com/EXXETA/JSONPatchSwift/graphs/contributors)

## License

Apache License v2.0
