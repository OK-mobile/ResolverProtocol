let package = Package(
    name: "DateFormatting",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ResolverProtocol",
            targets: ["ResolverProtocol"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ResolverProtocol",
            dependencies: [],
            path: "Classes"
        ),
    ]
)
