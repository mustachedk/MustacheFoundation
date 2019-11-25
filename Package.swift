// swift-tools-version:5.1
import PackageDescription

let package = Package(
  name: "MustacheFoundation",
  platforms: [
    .iOS(.v11)
  ],
  products: [
    .library(name: "MustacheFoundation", targets: ["MustacheFoundation"]),
  ],
  targets: [
    .target(name: "MustacheFoundation")
  ]
)
