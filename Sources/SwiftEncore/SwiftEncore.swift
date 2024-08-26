//
//  SwiftEncore.swift
//  SwiftEncore
//
//  Created by Siavash Davani on 26.08.2024.
//

import Foundation

// Generate a hex string from any sequence of bytes. This is in particular useful for converting a hash digest to hex string in the `Crypto` package.
extension Sequence where Self.Element == UInt8 {
    /// The lowercase hex string of 8-bit unsigned integers of this sequence.
    var hexString: String {
        return reduce(into: "") { accumulator, byte in
            accumulator += String(format: "%02x", byte)
        }
    }
}
