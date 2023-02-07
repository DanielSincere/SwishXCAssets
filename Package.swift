// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "SwishXCAssets",
  platforms: [.macOS(.v12)],
  products: [
    .library(name: "SwishXCAssets", targets: ["SwishXCAssets"]),
  ],
  dependencies: [
    .package(url: "https://github.com/0xLeif/Fork.git", from: "1.0.0"),
    .package(url: "https://github.com/swhitty/SwiftDraw.git", from: "0.13.3"),
  ],
  targets: [
    .target(name: "SwishXCAssets", dependencies: ["Fork", "SwiftDraw"]),
    .testTarget(name: "SwishXCAssetsTests", dependencies: ["SwishXCAssets"]),
  ]
)
