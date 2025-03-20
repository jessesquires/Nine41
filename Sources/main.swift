#!/usr/bin/swift

//
//  GitHub
//  https://github.com/jessesquires/Nine41
//
//  Copyright © 2019 Jesse Squires
//  https://www.jessesquires.com
//

import Foundation

#if os(OSX)

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
dateFormatter.timeZone = TimeZone.current
dateFormatter.locale = Locale.current

let isoDateFormatter = ISO8601DateFormatter()
isoDateFormatter.formatOptions = [
    .withFullDate,
    .withDashSeparatorInDate,
    .withFullTime,
    .withColonSeparatorInTime,
    .withFractionalSeconds,
    .withTimeZone
]

/// An ISO date/time string for 9:41 AM on Tuesday January 9, 2007
let date = dateFormatter.date(from: "2007-01-09T09:41:00")!
let simulatorDateTimeText = isoDateFormatter.string(from: date)

extension Process {
    /// Creates a process to execute `xcrun`.
    ///
    /// - Parameter args: The arguments to pass to `xcrun`.
    @discardableResult
    func xcrun(_ args: String...) -> Data {
        self.launchPath = "/usr/bin/xcrun"
        self.arguments = args

        let pipe = Pipe()
        self.standardOutput = pipe

        self.launch()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        self.waitUntilExit()
        return data
    }

    /// Executes `xcrun simctl list devices`
    @discardableResult
    func xcrun_list_devices() -> Data {
        self.xcrun("simctl", "list", "devices", "-j")
    }

    /// Executes `xcrun simctl status_bar` on the specified device to set overrides.
    ///
    /// - Parameter device: The device for which status bar values should be overridden.
    func xcrun_fix_status_bar(_ device: String) {
        self.xcrun(
            "simctl", "status_bar", device, "override",
            "--time", "\(simulatorDateTimeText)",
            "--dataNetwork", "wifi",
            "--wifiMode", "active",
            "--wifiBars", "3",
            "--cellularMode", "active",
            "--cellularBars", "4",
            "--operatorName", "",
            "--batteryState", "charged",
            "--batteryLevel", "100"
        )
    }

    /// Executes `xcrun simctl status_bar` on the specified device to clear all overrides.
    func xcrun_clear_status_bar(_ device: String) {
        self.xcrun("simctl", "status_bar", device, "clear")
    }
}

print("Fixing status bars...")

let deviceData = Process().xcrun_list_devices()
let json = (try? JSONSerialization.jsonObject(with: deviceData, options: [])) as! [String: Any]
let runtimes = json["devices"] as! [String: [Any]]
let allDevices = runtimes.values.flatMap { $0 } as! [[String: AnyHashable]]

var fixed = false

allDevices.forEach {
    let available = $0["isAvailable"] as! Bool
    let name = $0["name"] as! String
    let state = $0["state"] as! String
    let udid = $0["udid"] as! String

    if available && state != "Shutdown" {
        Process().xcrun_fix_status_bar(udid)
        print("✅ \(name), \(udid)")
        fixed = true
    }
}

if !fixed {
    print("❌ No simulators are running. Launch the iOS simulator first.")
}

#endif
