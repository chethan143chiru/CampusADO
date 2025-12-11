//
//  AnalyticsService.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation

class AnalyticsService {
    static let shared = AnalyticsService()
    
    private init() {}

    // Local event log (for testing/demo)
    private var events: [String] = []

    func logEvent(_ name: String, metadata: [String: String] = [:]) {
        let timestamp = Date().formatted()
        let meta = metadata.map { "\($0.key):\($0.value)" }.joined(separator: ", ")
        let entry = "[\(timestamp)] EVENT: \(name) { \(meta) }"

        print(entry) // Shows in Xcode debug console
        events.append(entry)
    }

    func getEvents() -> [String] {
        return events
    }
}
