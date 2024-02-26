// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "V2Visions",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "V2Visions",
            targets: ["AppModule"],
            bundleIdentifier: "Ansh.V2Visions",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .coins),
            accentColor: .presetColor(.indigo),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)