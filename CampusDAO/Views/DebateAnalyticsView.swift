//
//  DebateAnalyticsView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI
import Charts

struct DebateAnalyticsView: View {
    var analytics: DebateAnalytics

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Text("Debate Analytics")
                    .font(.largeTitle)
                    .bold()

                Text("Sentiment Score: \(String(format: "%.2f", analytics.sentimentScore))")
                    .font(.headline)
                    .padding(.vertical, 4)

                // Simple sentiment chart
                Chart {
                    LineMark(
                        x: .value("Index", 1),
                        y: .value("Sentiment", analytics.sentimentScore)
                    )
                }
                .frame(height: 150)

                Divider()

                Text("Pros")
                    .font(.title3)
                    .bold()
                ForEach(analytics.pros, id: \.self) { p in
                    Text("• \(p)")
                        .padding(.vertical, 4)
                }

                Divider()

                Text("Cons")
                    .font(.title3)
                    .bold()
                ForEach(analytics.cons, id: \.self) { c in
                    Text("• \(c)")
                        .padding(.vertical, 4)
                }
            }
            .padding()
        }
    }
}
