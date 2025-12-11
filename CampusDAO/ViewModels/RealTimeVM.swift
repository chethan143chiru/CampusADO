//
//  RealTimeVM.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class RealTimeVM: ObservableObject {
    @Published var messages: [Comment] = []
    @Published var isConnected = false

    private var cancellables = Set<AnyCancellable>()

    // Mock WebSocket connection
    func connect() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isConnected = true
        }
    }

    // Mock message send
    func sendMessage(text: String, proposalId: String, user: User) {
        let msg = Comment(
            proposalId: proposalId,
            author: user.name,
            text: text
        )

        messages.append(msg)
    }

    // Listener mock (simulate incoming messages)
    func simulateIncomingMessage(_ text: String, from author: String = "System") {
        let msg = Comment(
            proposalId: "demo",
            author: author,
            text: text
        )
        messages.append(msg)
    }

    func disconnect() {
        isConnected = false
    }
}
