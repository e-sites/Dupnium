// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Dupnium",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(name: "Dupnium", targets: ["Dupnium"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Dupnium",
            dependencies: [ ],
            path: "Sources"
        )
    ]
)
