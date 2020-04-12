// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

//  GitHub
//  https://github.com/jessesquires/Nine41
//
//  Copyright © 2019 Jesse Squires
//  https://www.jessesquires.com
//

import PackageDescription

let package = Package(
    name: "Nine41",
    platforms: [
        .macOS(.v10_15)
    ],
    targets: [
        .target(
            name: "Nine41",
            path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)
