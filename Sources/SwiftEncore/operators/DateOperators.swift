//
//  DateOperators.swift
//  SwiftEncore
//
//  Created by Siavash Davani on 02.09.2024.
//

import Foundation

// MARK: - Time + Date

public extension Date {
    /// The operator calculating the distance of two `Date`s resulting into a `TimeInterval`.
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

public extension TimeInterval {
    /// The minutes corresponding to this time interval.
    var minute: Double { self / 60 }
    /// The hours corresponding to this time interval.
    var hour: Double { self / 3600 }
}
