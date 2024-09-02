//
//  ThreeWayComparison.swift
//  SwiftEncore
//
//  Created by Siavash Davani on 02.09.2024.
//

// MARK: - Three-way comparison operator

infix operator <=>: ComparisonPrecedence

public func <=> <T: Comparable> (lhs: T, rhs: T) -> ThreeWayComparisonResult {
    if lhs < rhs { return .lhsLower }
    else if lhs > rhs { return .lhsGreater }
    else { return .lhsInclusive }
}

public func <=> <T: Comparable> (lhs: T, rhs: ClosedRange<T>) -> ThreeWayComparisonResult {
    if lhs < rhs.lowerBound { return .lhsLower }
    else if lhs > rhs.upperBound { return .lhsGreater }
    else { return .lhsInclusive }
}

/// The result of a three-way comparison
public enum ThreeWayComparisonResult: Int {
    /// The left-hand side is lower.
    case lhsLower = -1
    /// The left-hand side is either equal to the right-hand side, or it is included in the right-hand side in case of comparing ranges of items.
    case lhsInclusive = 0
    /// The left-hand side is larger.
    case lhsGreater = 1
}
