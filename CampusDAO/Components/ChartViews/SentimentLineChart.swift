//
//  SentimentLineChart.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI
import Charts

struct SentimentLineChart: View {
    var sentimentScore: Double  // more positive = happier debate

    struct Point: Identifiable {
        let id = UUID()
        let index: Int
        let value: Double
    }

    var body: some View {

        let timeline = (0..<10).map { i in
            Point(index: i, value: sentimentScore + Double.random(in: -0.2...0.2))
        }

        VStack(alignment: .leading) {
            Text("Sentiment Trend")
                .font(Theme.Fonts.headline)
                .padding(.bottom, 8)

            Chart(timeline) { point in
                LineMark(
                    x: .value("Index", point.index),
                    y: .value("Sentiment", point.value)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(point.value > 0 ? .green : .red)

                PointMark(
                    x: .value("Index", point.index),
                    y: .value("Sentiment", point.value)
                )
                .foregroundStyle(.blue)
            }
            .frame(height: 180)
        }
        .padding(Theme.Padding.card)
        .background(Theme.Colors.cardBackground)
        .cornerRadius(Theme.Radius.medium)
        .shadow(color: Theme.Shadow.light, radius: 5)
    }
}
