// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Quick",
    platforms: [
        .macOS(.v10_10), .iOS(.v8), .tvOS(.v9)
    ],
    products: [
        .library(name: "Quick", targets: ["Quick"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", .branch("master")),
    ],
    targets: {
        var targets: [Target] = [
            .testTarget(
                name: "QuickTests",
                dependencies: [ "Quick", "Nimble" ],
                exclude: [
                    "QuickAfterSuiteTests/AfterSuiteTests+ObjC.m",
                    "QuickFocusedTests/FocusedTests+ObjC.m",
                    "QuickTests/FunctionalTests/ObjC",
                    "QuickTests/Helpers/QCKSpecRunner.h",
                    "QuickTests/Helpers/QCKSpecRunner.m",
                    "QuickTests/Helpers/QuickTestsBridgingHeader.h",
                    "QuickTests/QuickConfigurationTests.m",
                ]
            ),
        ]
#if os(macOS)
        targets.append(contentsOf: [
            .target(name: "QuickSpecBase", dependencies: []),
            .target(name: "Quick", dependencies: [ "QuickSpecBase" ]),
        ])
#else
        targets.append(contentsOf: [
            .target(name: "Quick", dependencies: []),
        ])
#endif
        return targets
    }(),
    swiftLanguageVersions: [.v5]
)
