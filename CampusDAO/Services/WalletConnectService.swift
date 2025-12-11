//
//  WalletConnectService.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class WalletConnectService: ObservableObject {
    static let shared = WalletConnectService()
    @Published var connectedAddress: String? = nil

    func connectMock(name: String = "0xDEMO...") {
        // Simulate wallet connection
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.connectedAddress = name
        }
    }

    func disconnect() {
        connectedAddress = nil
    }
}
