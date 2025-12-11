//
//  VoteButton.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct VoteButton: View {
    var label: String
    var color: Color
    var action: () -> Void

    @State private var pressed = false

    var body: some View {
        Button(action: {
            pressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                pressed = false
                action()
            }
        }) {
            Text(label)
                .font(Theme.Fonts.headline)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
                .background(color.opacity(pressed ? 0.7 : 1.0))
                .cornerRadius(Theme.Radius.medium)
                .scaleEffect(pressed ? 0.95 : 1.0)
                .animation(.easeOut(duration: 0.15), value: pressed)
        }
        .buttonStyle(.plain)
    }
}
