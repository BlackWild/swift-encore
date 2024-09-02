//
//  ByteArrays.swift
//  SwiftEncore
//
//  Created by Siavash Davani on 02.09.2024.
//

import Foundation

// MARK: - Byte Arrays

// Generate a hex string from any sequence of bytes. This is in particular useful for converting a hash digest to hex string in the `Crypto` package.
public extension Sequence where Self.Element == UInt8 {
    /// The lowercase hex string of 8-bit unsigned integers of this sequence.
    var hexString: String {
        return reduce(into: "") { accumulator, byte in
            accumulator += String(format: "%02x", byte)
        }
    }
}
