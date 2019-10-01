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
    func xcrun(_ args: String...) -> Data {
        self.launchPath = "/usr/bin/xcrun"
        self.arguments = args

        let pipe = Pipe()
        self.standardOutput = pipe

        self.launch()
        self.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return data
    }

    /// Executes `xcrun simctl list devices`
    @discardableResult
    func xcrun_list_devices() -> Data {
        return self.xcrun("simctl", "list", "devices", "-j")
    }

    /// Executes `xcrun simctl status_bar` on the specified device.
    ///
    /// - Parameter device: The device for which status bar values should be overridden.
    func xcrun_fix_status_bar(_ device: String) {
        self.xcrun(
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

let deviceData = Process().xcrun_list_devices()
let json = (try! JSONSerialization.jsonObject(with: deviceData, options: [])) as! Dictionary<String, Any>
let runtimes = json["devices"] as! Dictionary<String, Array<Any>>
let allDevices = runtimes.values.flatMap { $0 } as! Array<Dictionary<String, AnyHashable>>

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
