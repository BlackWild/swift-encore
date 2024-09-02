//
//  TimeKeeper.swift
//  SwiftEncore
//
//  Created by Siavash Davani on 02.09.2024.
//

import SwiftUI

// TODO: add date components like day, hour, minute and others also to the properties of the TimeKeeper so that some observer might observer them individually instead of the actual Date! The timer should check if they need to be updated.

// TODO: is using GCD timer better? https://gist.github.com/myobie/132bb06b59e7e218475cb9286761e393

// MARK: - TimeKeeper

/// The `TimeKeeper` keeps track of time by exposing an `Observable` variable `currentTime`. The `currentTime` is updated in intervals and when you use it in an observed environment like the `body` of a SwiftUI `View`, the view will be updated on change of the `currentTime` variable.
@available(iOS 17.0, *)
@Observable
public final class TimeKeeper {
    
    // MARK: - Exposed properties
    
    private(set) var currentTime: Date = .now
    
    // MARK: - Core properties
    
    private var timer: Timer?
    private let timeInterval: TimeInterval
    
    init(timeInterval: TimeInterval = 0.9999) {
        self.timeInterval = timeInterval
        self.startTimer()
    }
    
    deinit {
        self.stopTimer()
    }
    
    // MARK: - Private functions
    
    @objc private func fireTimer() {
        self.currentTime = .now
    }
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: self.timeInterval, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        self.timer?.fire()
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
}

// MARK: - The End
