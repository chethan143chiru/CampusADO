//
//  WebSocketManager.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class WebSocketManager: ObservableObject {

    static let shared = WebSocketManager()

    @Published var connected = false
    @Published var incomingMessages: [String] = []

    private var cancellables = Set<AnyCancellable>()
    private var timer: Timer?

    private init() {}

    // Mock connect – simulate WebSocket ready state
    func connect() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.connected = true
            self.startMockListener()
        }
    }

    func disconnect() {
        connected = false
        stopMockListener()
    }

    // MARK: - Mock incoming message events
    private func startMockListener() {
        timer = Timer.scheduledTimer(withTimeInterval: 8, repeats: true) { _ in
            let msg = self.randomSystemMessage()
            DispatchQueue.main.async {
                self.incomingMessages.append(msg)
            }
        }
    }

    private func stopMockListener() {
        timer?.invalidate()
        timer = nil
    }

    // MARK: - For demo purposes
    private func randomSystemMessage() -> String {
        let messages = [
            "New voter joined the debate!",
            "Sentiment shifted slightly.",
            "Admin is observing this proposal.",
            "New comment added by a participant."
        ]
        return messages.randomElement() ?? "System update"
    }

    // MARK: - Send message
    func sendMessage(_ message: String) {
        // Replace this with real Socket.IO emit or Firebase push
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.incomingMessages.append("You: \(message)")
        }
    }
}
