//
//  ConnectWalletView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct ConnectWalletView: View {
    @EnvironmentObject var authVM: AuthVM
    @ObservedObject var wc = WalletConnectService.shared

    var body: some View {
        VStack(spacing: 16) {
            if let addr = wc.connectedAddress {
                Text("Connected: \(addr)").bold()
                Button("Disconnect") {
                    wc.disconnect()
                    authVM.logout()
                }.buttonStyle(.borderedProminent)
            } else {
                Text("Connect a Wallet (Mock)").font(.headline)
                Button("Connect Demo Wallet") {
                    wc.connectMock(name: "0xDEMO1234")
                    authVM.loginMock(name: "Chiru", wallet: "0xDEMO1234")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}
