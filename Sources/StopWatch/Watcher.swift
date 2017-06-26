//
// Watcher.swift
// Copyright © 2017 Matej Kosiarcik. All rights reserved.
//

import Foundation

public final class Watcher {
    private let onUpdate: (Interval) -> Void
    private let updateInterval: TimeInterval
    private var laps = [Date]()
    private var isActive = false

    // MARK: De/Init
    public init(each interval: TimeInterval = 0.001, onUpdate: @escaping (Interval) -> Void) {
        self.updateInterval = interval
        self.onUpdate = onUpdate
    }

    deinit {
        self.stop()
    }
}

// MARK: - Updating
extension Watcher {
    private func update() {
        guard self.isActive else { return }
        let current = Date()
        let interval = Interval(cumulative: self.laps.first!.timeIntervalSince(current),
                                lapped: self.laps.last!.timeIntervalSince(current))
        self.onUpdate(interval)
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + self.updateInterval) { self.update() }
    }
}

// MARK: - Start/Stop
extension Watcher {
    public func start() {
        self.laps.append(Date())
        self.isActive = true
        self.update()
    }

    public func stop() {
        self.isActive = false
    }
}
