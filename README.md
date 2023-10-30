# DPVersion

[![Swift](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdanielepantaleone%2FDPVersion%2Fbadge%3Ftype%3Dswift-versions&style=flat-square)](https://swiftpackageindex.com/danielepantaleone/DPVersion)
[![Platform](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdanielepantaleone%2FDPVersion%2Fbadge%3Ftype%3Dplatforms&style=flat-square)](https://swiftpackageindex.com/danielepantaleone/DPVersion)
![Cocoapods](https://img.shields.io/cocoapods/v/DPVersion?style=flat-square)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/danielepantaleone/DPVersion?style=flat-square)
![GitHub](https://img.shields.io/github/license/danielepantaleone/DPVersion?style=flat-square)
[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/danielepantaleone/DPVersion/swift-tests.yml?style=flat-square&logo=github)](https://github.com/danielepantaleone/DPVersion/actions/workflows/swift-tests.yml)

A data model to store and compare software version numbers (https://semver.org)

## Table of contents

* [Usage](#usage)
* [Advanced usage](#advanced-usage)
* [Requirements](#requirements)
* [Installation](#installation)
    * [Cocoapods](#cocoapods)
    * [Swift Package Manager](#swift-package-manager)
* [Contributing](#contributing)
* [License](#license)

## Usage

```swift
import DPVersion

let a: DPVersion = "1.6.4-alpha.5" // literal init with long prerelease tag
let b: DPVersion = "1.6.4-b5" // literal init with short prerelease tag
let c: DPVersion = DPVersion(major: 2, minor: 7, patch: 0, beta: 5) // default initializer
let d: DPVersion = "2.0.0" // literal init with major + minor + patch
let e: DPVersion = "2.0" // literal init with major + minor
```

## Requirements

- iOS **11+**
- Xcode **15+** 
- Swift **5.7+**  

## Installation

### Cocoapods

Add the dependency to the `DPVersion` framework in your `Podfile`:

```ruby
pod 'DPVersion', '~> 1.0.0'
```

### Swift Package Manager

Add it as a dependency in a Swift Package:

```swift
dependencies: [
    .package(url: "https://github.com/danielepantaleone/DPVersion.git", .upToNextMajor(from: "1.0.0"))
]
```

## Contributing

If you like this project you can contribute it by:

- Submit a bug report by opening an [issue](https://github.com/danielepantaleone/DPVersion/issues)
- Submit code by opening a [pull request](https://github.com/danielepantaleone/DPVersion/pulls)

## License

```
MIT License

Copyright (c) 2023 Daniele Pantaleone

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
