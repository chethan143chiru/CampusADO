//
//  VoteBarChart.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI
import Charts

struct VoteBarChart: View {
    var yesCount: Int
    var noCount: Int

    struct VoteData: Identifiable {
        let id = UUID()
        let label: String
        let count: Int
        let color: Color
    }

    var body: some View {
        let data = [
            VoteData(label: "Yes", count: yesCount, color: .green),
            VoteData(label: "No", count: noCount, color: .red)
        ]

        VStack(alignment: .leading) {
            Text("Vote Breakdown")
                .font(Theme.Fonts.headline)
                .padding(.bottom, 8)

            Chart(data) { item in
                BarMark(
                    x: .value("Votes", item.count),
                    y: .value("Option", item.label)
                )
                .foregroundStyle(item.color)
            }
            .frame(height: 160)
        }
        .padding(Theme.Padding.card)
        .background(Theme.Colors.cardBackground)
        .cornerRadius(Theme.Radius.medium)
        .shadow(color: Theme.Shadow.light, radius: 5)
    }
}
