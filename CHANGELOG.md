# CHANGELOG

The changelog for `Nine41`. Also see the [releases](https://github.com/jessesquires/Nine41/releases) on GitHub.

4.0.2
-----

- Fix Daylight Savings bug (but good this time) ([#73](https://github.com/jessesquires/Nine41/issues/73), [@joeljfischer](https://github.com/joeljfischer))

4.0.1
-----

- Fix Daylight Savings bug (again, I think, lol) ([#72](https://github.com/jessesquires/Nine41/issues/72), [@jessesquires](https://github.com/jessesquires))

4.0.0
-----

- Upgraded to Xcode 16 and Swift 6.
- Dropped support for CocoaPods.

3.0.0
-----

- Minimum macOS 11.0 now required
- Fixed "Invalid argument" error for `--time` value in Xcode 15.3 ([#70](https://github.com/jessesquires/Nine41/issues/70), [@jessesquires](https://github.com/jessesquires))
- Performance optimizations, only create date formatters once ([@jessesquires](https://github.com/jessesquires))

2.3.1
-----

- Fix Daylight Savings bug ([@jessesquires](https://github.com/jessesquires))
- Xcode 14 and Swift 5.7 ([@jessesquires](https://github.com/jessesquires))

2.3.0
-----

- Xcode 13 and Swift 5.5 ([@jessesquires](https://github.com/jessesquires))

2.2.0
-----

- Update to Swift 5.3 ([@jessesquires](https://github.com/jessesquires))

2.1.0
-----

- Fixed issue where script might hang. ([#11](https://github.com/jessesquires/Nine41/issues/11), [@jessesquires](https://github.com/jessesquires))

- Fixed issue where "9:41" would display incorrect date/time in timezones outside of US Pacific. ([#13](https://github.com/jessesquires/Nine41/issues/13), [@aoenth](https://github.com/aoenth))

- Added support for CocoaPods. See `README` for instructions. ([#12](https://github.com/jessesquires/Nine41/issues/12), [@ricsantos](https://github.com/ricsantos))

2.0.1
-----

- Added an `.executable` product to the Swift package ([@jessesquires](https://github.com/jessesquires))

2.0.0
-----

- Now requires Xcode 11.4

- Add Swift Package Manager support ([@jessesquires](https://github.com/jessesquires))

- Set date text to `Tuesday January 9`, which shows on iPad status bars ([#4](https://github.com/jessesquires/Nine41/pull/4), [@tfe](https://github.com/tfe))

- Setup SwiftLint for project ([#5](https://github.com/jessesquires/Nine41/issues/5), [@jessesquires](https://github.com/jessesquires))

- Setup Danger for project ([#9](https://github.com/jessesquires/Nine41/issues/9), [@jessesquires](https://github.com/jessesquires))

- Override the operator (carrier) name to be the empty string ([#8](https://github.com/jessesquires/Nine41/issues/8), [@jessesquires](https://github.com/jessesquires))

1.0
---

Initial release.
