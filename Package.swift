// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MRGControlPanel",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "MRGControlPanel",
            targets: ["MRGControlPanel"]
        )
    ],
    targets: [
        .target(
            name: "MRGControlPanel",
            path: "Sources/MRGControlPanel",
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("MessageUI")
            ]
        )
    ]
)
