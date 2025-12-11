//
//  BadgeViews.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct BadgeViews: View {
    var title: String
    var color: Color
    var icon: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
                .padding(12)
                .background(color)
                .clipShape(Circle())

            Text(title)
                .font(Theme.Fonts.headline)
                .foregroundColor(Theme.Colors.textPrimary)

            Spacer()
        }
        .padding(Theme.Padding.card)
        .background(Theme.Colors.cardBackground)
        .cornerRadius(Theme.Radius.medium)
        .shadow(color: Theme.Shadow.light, radius: 4, x: 0, y: 2)
    }
}
