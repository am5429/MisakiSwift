// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MisakiSwift",
  platforms: [
    .iOS(.v18), .macOS(.v15)
  ],
  products: [
    .library(
      name: "MisakiSwift",
      type: .dynamic,
      targets: ["MisakiSwift"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/ml-explore/mlx-swift", exact: "0.31.4"),
    .package(url: "https://github.com/am5429/MLXUtilsLibrary.git", revision: "66f7cd58026f335c46699f0f8030cb3bda495c54")
  ],
  targets: [
    .target(
      name: "MisakiSwift",
      dependencies: [
        .product(name: "MLX", package: "mlx-swift"),
        .product(name: "MLXNN", package: "mlx-swift"),
        .product(name: "MLXUtilsLibrary", package: "MLXUtilsLibrary")
     ],
     resources: [
      .copy("Resources/gb_bart_config.json"),
      .copy("Resources/gb_bart.safetensors"),
      .copy("Resources/gb_gold.json"),
      .copy("Resources/gb_silver.json"),
      .copy("Resources/us_bart_config.json"),
      .copy("Resources/us_bart.safetensors"),
      .copy("Resources/us_gold.json"),
      .copy("Resources/us_silver.json")
     ]
    ),
    .testTarget(
      name: "MisakiSwiftTests",
      dependencies: ["MisakiSwift"]
    ),
  ]
)
