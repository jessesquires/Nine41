#!/usr/bin/swift

//
//  GitHub
//  https://github.com/jessesquires/Nine41
//
//  Copyright © 2019 Jesse Squires
//  https://www.jessesquires.com
//

import Foundation

extension String {
    var nsRange: NSRange {
        return NSRange(location: 0, length: self.count)
    }
}

extension StringProtocol {
    var byTrimmingWhiteSpace: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension Process {
    /// Creates a process to execute `xcrun`.
    ///
    /// - Parameter args: The arguments to pass to `xcrun`.
    @discardableResult
    func xcrun(_ args: String...) -> String {
        self.launchPath = "/usr/bin/xcrun"
        self.arguments = args

        let pipe = Pipe()
        self.standardOutput = pipe

        self.launch()
        self.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()

        guard let output = String(data: data, encoding: .utf8) else {
            return ""
        }
        return output
    }

    /// Executes `xcrun simctl list devices`
    @discardableResult
    func xcrun_list_devices() -> String {
        return self.xcrun("simctl", "list", "devices")
    }

    /// Executes `xcrun simctl status_bar` on the specified device.
    ///
    /// - Parameter device: The device for which status bar values should be overridden.
    @discardableResult
    func xcrun_fix_status_bar(_ device: String) -> String {
        return self.xcrun(
            "simctl", "status_bar", device, "override",
            "--time", "9:41",
            "--dataNetwork", "wifi",
            "--wifiMode", "active",
            "--wifiBars", "3",
            "--cellularMode", "active",
            "--cellularBars", "4",
            "--batteryState", "charged",
            "--batteryLevel", "100"
        )
    }
}

print("Fixing status bars...")

let devicesList = Process().xcrun_list_devices()
let devices = devicesList.split(separator: "\n").map { String($0) }

/// Regex to match the device identifier in device list.
///
/// == Example ==
/// input: "iPhone X (10939DAA-4FBA-489A-AAF3-555E224146B1) (Shutdown)"
/// match: "(10939DAA-4FBA-489A-AAF3-555E224146B1)"
let regex = try! NSRegularExpression(pattern: #"(\(([\w\-]{36})\))"#, options: [])

// flag to track if no simulators are running
var fixed = false

devices.forEach {
    let count = $0.count
    let rangeOfMatch = regex.rangeOfFirstMatch(in: $0, options: [], range: $0.nsRange)

    if rangeOfMatch.location != NSNotFound {
        let deviceName = $0.dropLast(count - rangeOfMatch.location).byTrimmingWhiteSpace
        let deviceID = $0
            .dropFirst(rangeOfMatch.lowerBound + 1) // + 1 to remove the "("
            .dropLast(count - rangeOfMatch.lowerBound - rangeOfMatch.length + 1) // +1 to remove the ")"
            .byTrimmingWhiteSpace
        let deviceStatus = $0.dropFirst(rangeOfMatch.upperBound).byTrimmingWhiteSpace

        if deviceStatus.contains("Booted") {
            Process().xcrun_fix_status_bar(deviceID)
            print("✅ \(deviceName), \(deviceID)")
            fixed = true
        }
    }
}

if !fixed {
    print("❌ No simulators are running. Launch the iOS simulator first.")
}
