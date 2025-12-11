//
//  WalletVM.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class WalletVM: ObservableObject {
    @Published var walletAddress: String? = nil
    @Published var isConnected = false

    private var cancellables = Set<AnyCancellable>()
    private let wc = WalletConnectService.shared

    init() {
        wc.$connectedAddress
            .sink { [weak self] addr in
                self?.walletAddress = addr
                self?.isConnected = (addr != nil)
            }
            .store(in: &cancellables)
    }

    func connect() {
        wc.connectMock()
    }

    func disconnect() {
        wc.disconnect()
    }
}
