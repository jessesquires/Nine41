# Nine41 ![CI](https://github.com/jessesquires/Nine41/workflows/CI/badge.svg)

*Automate overriding the status bars for all running iOS simulators*

## About

Blog posts:

* [
Overriding status bar display settings in the iOS simulator](https://www.jessesquires.com/blog/overriding-status-bar-settings-ios-simulator/)
* [A script to automate overriding iOS simulator status bar values](https://www.jessesquires.com/blog/automating-simctl-status-bar/)

[Xcode 11](https://developer.apple.com/documentation/xcode_release_notes/xcode_11_release_notes) shipped with `simctl status_bar`, a tool to override the status bar values in the simulator so you can take perfect screenshots.

However, it has some issues:
* The overrides do not persist across launches of the simulator
* The numerous override options are difficult to remember
* There are no sensible defaults

This script fixes most of those issues. It overrides the status bars for all currently running simulators using "Apple's defaults" &mdash; full cellular bars, full wifi bars, full battery, no "carrier" name, and `9:41` for the time.

## Requirements

- Swift 5.2+
- Xcode 11.4+
- [SwiftLint](https://github.com/realm/SwiftLint)

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

## Contributing

Interested in making contributions to this project? Please review the guides below.

- [Contributing Guidelines](https://github.com/jessesquires/.github/blob/master/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/jessesquires/.github/blob/master/CODE_OF_CONDUCT.md)
- [Support and Help](https://github.com/jessesquires/.github/blob/master/SUPPORT.md)
- [Security Policy](https://github.com/jessesquires/.github/blob/master/SECURITY.md)

Also, consider [sponsoring this project](https://www.jessesquires.com/sponsor/) or [buying my apps](https://www.hexedbits.com)! :v:

## License

Released under an [MIT License](https://opensource.org/licenses/MIT). See `LICENSE` for details.

>**Copyright &copy; 2019 Jesse Squires.**
