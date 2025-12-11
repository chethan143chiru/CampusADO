//
//  DateUtils.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation

struct DateUtils {

    // MARK: - Format to readable string
    static func format(_ date: Date, style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    // MARK: - Relative date title
    static func timeAgo(from date: Date) -> String {
        let seconds = Int(Date().timeIntervalSince(date))

        switch seconds {
        case 0..<60:
            return "Just now"
        case 60..<3600:
            return "\(seconds / 60)m ago"
        case 3600..<86400:
            return "\(seconds / 3600)h ago"
        case 86400..<604800:
            return "\(seconds / 86400)d ago"
        default:
            return format(date)
        }
    }

    // MARK: - Convert string to Date
    static func fromISO(_ iso: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: iso)
    }

    // MARK: - Convert Date to ISO string
    static func toISO(_ date: Date) -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: date)
    }
}
