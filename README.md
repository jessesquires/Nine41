# Nine41 ![CI](https://github.com/jessesquires/Nine41/workflows/CI/badge.svg)

*Automate overriding the status bars for all running iOS simulators*

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fjessesquires%2FNine41%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/jessesquires/Nine41) <br> [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fjessesquires%2FNine41%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/jessesquires/Nine41)

![perfect status bar](https://raw.githubusercontent.com/jessesquires/Nine41/main/screenshot.png)

## About

Blog posts:

* [Fully automating perfect status bar overrides for iOS simulators with Nine41](https://www.jessesquires.com/blog/2020/04/13/fully-automating-perfect-status-bar-overrides-for-ios-simulators/)
* [A script to automate overriding iOS simulator status bar values](https://www.jessesquires.com/blog/2019/09/30/automating-simctl-status-bar/)
* [Overriding status bar display settings in the iOS simulator](https://www.jessesquires.com/blog/2019/09/26/overriding-status-bar-settings-ios-simulator/)

[Xcode 11](https://developer.apple.com/documentation/xcode_release_notes/xcode_11_release_notes) shipped with `simctl status_bar`, a tool to override the status bar values in the simulator so you can take perfect screenshots.

However, it has some issues:
* The overrides do not persist across launches of the simulator
* The numerous override options are difficult to remember
* There are no sensible defaults

This script fixes most of those issues. It overrides the status bars for all currently running simulators using "Apple's defaults" &mdash; full cellular bars, full wifi bars, full battery, no "carrier" name, and `9:41` for the time.

## Requirements

- Swift 5.9+
- Xcode 15.0+

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

Add `Nine41` to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/jessesquires/Nine41.git", from: "2.0.0")
]
```

Alternatively, you can add the package [directly via Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

### [CocoaPods](https://cocoapods.org)

```ruby
pod 'Nine41'
```

## Usage

After cloning the repo, you can create a custom bash command:

```bash
function nine41() {
  swift run --package-path /PATH/TO/Nine41/
}
```

Then you can run this from the command line.

Example run with 2 open simulators:

```bash
$ nine41
Fixing status bars...
✅ iPhone 8, 65A6C323-E74D-452C-B85E-7F576259E022
✅ iPhone 11, 52E8FAD0-7743-4F85-AA2E-26E4C1275F38
```

Example run with no open simulators:

```bash
$ nine41
Fixing status bars...
❌ No simulators are running. Launch the iOS simulator first.
```

## Automation with Xcode build phases

As described [in this post](https://www.jessesquires.com/blog/2020/04/13/fully-automating-perfect-status-bar-overrides-for-ios-simulators/), you can automate your perfect status bars using Xcode build phases.

1. Add the Swift package to your Xcode project
2. Add a "Run Script" build phase with the following:

For Swift Package Manager installations:

```bash
/usr/bin/xcrun --sdk macosx swift run --package-path "${BUILD_ROOT}/../../SourcePackages/checkouts/Nine41"
```

For CocoaPods installations:

```bash
/usr/bin/xcrun --sdk macosx swift "${PODS_ROOT}/Nine41/Sources/main.swift"
```

3. Build and run. Note that simulators must be booted for the script to work, which means the very first run may not produce results but the subsequent runs will.

## Contributing

Interested in making contributions to this project? Please review the guides below.

- [Contributing Guidelines](https://github.com/jessesquires/.github/blob/master/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/jessesquires/.github/blob/master/CODE_OF_CONDUCT.md)
- [Support and Help](https://github.com/jessesquires/.github/blob/master/SUPPORT.md)
- [Security Policy](https://github.com/jessesquires/.github/blob/master/SECURITY.md)

Also, consider [sponsoring this project](https://www.jessesquires.com/sponsor/) or [buying my apps](https://www.hexedbits.com)! :v:

## License

Released under an [MIT License](https://opensource.org/licenses/MIT). See `LICENSE` for details.

> **Copyright &copy; 2019-present Jesse Squires.**
