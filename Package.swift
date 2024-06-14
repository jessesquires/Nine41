// swift-tools-version:5.10
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
        .macOS(.v11)
    ],
    products: [
        .executable(name: "nine41", targets: ["Nine41"])
    ],
    targets: [
        .executableTarget(
            name: "Nine41",
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)
