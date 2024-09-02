//
//  SwiftEncore.swift
//  SwiftEncore
//
//  Created by Siavash Davani on 26.08.2024.
//

import Foundation

// MARK: - Byte Arrays

// Generate a hex string from any sequence of bytes. This is in particular useful for converting a hash digest to hex string in the `Crypto` package.
extension Sequence where Self.Element == UInt8 {
    /// The lowercase hex string of 8-bit unsigned integers of this sequence.
    var hexString: String {
        return reduce(into: "") { accumulator, byte in
            accumulator += String(format: "%02x", byte)
        }
    }
}

// MARK: - Time + Date

extension Date {
    /// The operator calculating the distance of two `Date`s resulting into a `TimeInterval`.
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

extension TimeInterval {
    /// The minutes corresponding to this time interval.
    var minute: Double { self / 60 }
    /// The hours corresponding to this time interval.
    var hour: Double { self / 3600 }
}
