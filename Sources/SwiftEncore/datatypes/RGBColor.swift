//
//  CodableColor.swift
//  SwiftEncore
//
//  Created by Siavash Davani on 02.09.2024.
//

/// The default `Color` type from Swift is not Codable. This is a reduced codable version of `Color` available for use in `SwiftData`.
public struct CodableColor: Codable, Sendable {
    var red: Double
    var green: Double
    var blue: Double
    var opacity: Double
}


#if canImport(SwiftUI)

import SwiftUI

@available(iOS 13.0, *)
public extension CodableColor {
    var color: Color {
        Color(red: red, green: green, blue: blue, opacity: opacity)
    }
}


@available(iOS 17.0, *)
public extension CodableColor {
    init(fromColor color: Color, in environment: EnvironmentValues = .init()) {
        let resolved = color.resolve(in: environment)
        self.red = Double(resolved.red)
        self.green = Double(resolved.green)
        self.blue = Double(resolved.blue)
        self.opacity = Double(resolved.opacity)
    }
}

#endif
