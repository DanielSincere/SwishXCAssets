// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "CreateXCAssets",
  platforms: [.macOS(.v12)],
  products: [
    .library(name: "CreateXCAssets", targets: ["CreateXCAssets"]),
  ],
  dependencies: [
    .package(url: "https://github.com/0xLeif/Fork.git", from: "1.0.0"),
    .package(url: "https://github.com/swhitty/SwiftDraw.git", from: "0.13.3"),
  ],
  targets: [
    .target(name: "CreateXCAssets", dependencies: ["Fork", "SwiftDraw"]),
    .testTarget(name: "CreateXCAssetsTests", dependencies: ["CreateXCAssets"]),
  ]
)
