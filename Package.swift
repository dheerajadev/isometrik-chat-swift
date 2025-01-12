// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IsometrikChat",
    platforms: [.iOS(.v17),],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IsometrikChat",
            targets: ["IsometrikChat"]),
        .library(
            name: "IsometrikChatUI",
            targets: ["IsometrikChatUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/googlemaps/ios-places-sdk", from: "9.0.0"),
        .package(url: "https://github.com/googlemaps/ios-maps-sdk", from: "9.0.0"),
        .package(url: "https://github.com/optonaut/ActiveLabel.swift", from: "1.1.5"),
        .package(url: "https://github.com/guoyingtao/Mantis", from: "1.9.0"),
        .package(url: "https://github.com/Yummypets/YPImagePicker", from: "5.2.2"),
        .package(url: "https://github.com/UWAppDev/SwiftUI-MediaPicker", from: "0.2.0"),
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.8.1"),
        .package(url: "https://github.com/appscrip-3embed/isometrik-swift-call",branch: "main"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "9.0.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.1.1"),
        .package(url: "https://github.com/realm/realm-swift",branch: "master"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess",branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "IsometrikChat",
            dependencies: [
                .product(name: "GooglePlaces", package: "ios-places-sdk"),
                .product(name: "GoogleMaps", package: "ios-maps-sdk"),
                .product(name: "ActiveLabel", package: "activelabel.swift"),
                .product(name: "Mantis", package: "mantis"),
                .product(name: "YPImagePicker", package: "ypimagepicker"),
                .product(name: "MediaPicker", package: "swiftui-mediapicker"),
                .product(name: "Alamofire", package: "alamofire"),
                .product(name: "ISMSwiftCall", package: "isometrik-swift-call"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "SDWebImageSwiftUI", package: "sdwebimageswiftui"),
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "KeychainAccess", package: "keychainaccess"),
            ]),
        .target(
            name: "IsometrikChatUI",
            dependencies: [
                .product(name: "GooglePlaces", package: "ios-places-sdk"),
                .product(name: "GoogleMaps", package: "ios-maps-sdk"),
                .product(name: "ActiveLabel", package: "activelabel.swift"),
                .product(name: "Mantis", package: "mantis"),
                .product(name: "YPImagePicker", package: "ypimagepicker"),
                .product(name: "MediaPicker", package: "swiftui-mediapicker"),
                .product(name: "Alamofire", package: "alamofire"),
                .product(name: "ISMSwiftCall", package: "isometrik-swift-call"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
                .product(name: "SDWebImageSwiftUI", package: "sdwebimageswiftui"),
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "KeychainAccess", package: "keychainaccess"),
            ],resources: [
                .process("Resources/Assets.xcassets")
            ])
        
    ]
)
