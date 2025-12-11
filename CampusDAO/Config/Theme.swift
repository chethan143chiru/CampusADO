//
//  Theme.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct Theme {

    // MARK: - Colors
    struct Colors {
        static let primary = Color.blue
        static let accent = Color.purple
        static let background = Color(.systemBackground)
        static let cardBackground = Color(.secondarySystemBackground)
        static let textPrimary = Color.primary
        static let textSecondary = Color.secondary
        static let success = Color.green
        static let danger = Color.red
        static let warning = Color.orange
    }

    // MARK: - Typography
    struct Fonts {
        static let largeTitle = Font.system(size: 32, weight: .bold)
        static let title = Font.system(size: 24, weight: .semibold)
        static let headline = Font.system(size: 18, weight: .semibold)
        static let body = Font.system(size: 16, weight: .regular)
        static let caption = Font.system(size: 14, weight: .regular)
        static let small = Font.system(size: 12, weight: .light)
    }

    // MARK: - Spacing
    struct Spacing {
        static let small: CGFloat = 6
        static let medium: CGFloat = 12
        static let large: CGFloat = 20
        static let extraLarge: CGFloat = 32
    }

    // MARK: - Corner Radius
    struct Radius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 14
        static let large: CGFloat = 24
    }

    // MARK: - Shadows
    struct Shadow {
        static let light = Color.black.opacity(0.08)
        static let medium = Color.black.opacity(0.15)
        static let heavy = Color.black.opacity(0.25)
    }

    // MARK: - Padding
    struct Padding {
        static let card = EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        static let screen = EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
    }

}
