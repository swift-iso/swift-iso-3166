// swift-tools-version:6.2

import PackageDescription

extension String {
    static let iso3166: Self = "ISO 3166"
}

extension String { var tests: Self { self + " Tests" } }

extension Target.Dependency {
    static var iso3166: Self { .target(name: .iso3166) }
    static var standards: Self { .product(name: "Standards", package: "swift-standards") }
    static var incits_4_1986: Self { .product(name: "INCITS 4 1986", package: "swift-incits-4-1986") }
    static var standardsTestSupport: Self { .product(name: "StandardsTestSupport", package: "swift-standards") }
}

let package = Package(
    name: "swift-iso-3166",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(name: .iso3166, targets: [.iso3166]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-standards", from: "0.10.0"),
        .package(url: "https://github.com/swift-standards/swift-incits-4-1986", from: "0.6.3")
    ],
    targets: [
        .target(
            name: .iso3166,
            dependencies: [
                .standards,
                .incits_4_1986
            ],
            resources: [
                .copy("Data")
            ]
        ),
        .testTarget(
            name: .iso3166.tests,
            dependencies: [
                .iso3166,
                .incits_4_1986,
                .standardsTestSupport
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
