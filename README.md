# Nine41
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

This script fixes that. It overrides the status bars for all currently running simulators using "Apple's defaults" &mdash; full cellular bars, full wifi bars, full battery, and `9:41` for the time.

## License

Released under an [MIT License](https://opensource.org/licenses/MIT). See `LICENSE` for details.

>**Copyright &copy; 2019 Jesse Squires.**
