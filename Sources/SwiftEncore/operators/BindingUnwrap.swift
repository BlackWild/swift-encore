//
//  BindingUnwrap.swift
//  SwiftEncore
//
//  Created by Siavash Davani on 02.09.2024.
//

// MARK: - Optional default unwrapping

#if canImport(SwiftUI)

import SwiftUI

/// The nil-coalescing operator but for `Binding` types. The operator converts a `Binding<T?>` type to `Binding<T>` by providing a constant **Default** binding in case of `nil`.
/// Use it as
/// ```
/// DatePicker(selection: $selectedDate ?? Date.distantPast)
/// ```
/// where you can change `Date.distantPast` to your **default** value.
@available(iOS 13.0, *)
func ?? <T: Sendable> (lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

#endif
