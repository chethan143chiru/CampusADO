//
//  PresenceManager.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class PresenceManager: ObservableObject {

    static let shared = PresenceManager()

    @Published var onlineUsers: [String] = []
    @Published var activeCount: Int = 0

    private var timer: Timer?

    private init() {}

    // MARK: - Simulate network presence updates
    func startTracking() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            self.simulatePresenceChange()
        }
    }

    func stopTracking() {
        timer?.invalidate()
        timer = nil
    }

    // Mock presence events
    private func simulatePresenceChange() {
        let sampleUsers = [
            "Chiru",
            "Arun",
            "Megha",
            "Sahana",
            "Rakesh",
            "GuestUser"
        ]

        let count = Int.random(in: 1...sampleUsers.count)
        let online = Array(sampleUsers.shuffled().prefix(count))

        DispatchQueue.main.async {
            self.onlineUsers = online
            self.activeCount = online.count
        }
    }

    // MARK: - Manual update
    func userJoined(_ name: String) {
        if !onlineUsers.contains(name) {
            onlineUsers.append(name)
        }
        activeCount = onlineUsers.count
    }

    func userLeft(_ name: String) {
        onlineUsers.removeAll { $0 == name }
        activeCount = onlineUsers.count
    }
}
