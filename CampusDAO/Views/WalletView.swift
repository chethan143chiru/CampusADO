//
//  WalletView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct WalletView: View {
    @StateObject var walletVM = WalletVM()

    var body: some View {
        VStack(spacing: 20) {

            Text("Wallet")
                .font(.largeTitle)
                .bold()

            if let addr = walletVM.walletAddress {
                Text("Address:")
                    .font(.headline)
                Text(addr)
                    .font(.callout)
                    .foregroundColor(.secondary)

                Divider()

                Text("CampusCoin Balance")
                    .font(.headline)
                Text("42.0")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.green)

                Button("Disconnect") {
                    walletVM.disconnect()
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)

            } else {
                Text("No wallet connected.")
                    .foregroundColor(.secondary)

                Button("Connect Wallet (Mock)") {
                    walletVM.connect()
                }
                .buttonStyle(.borderedProminent)
            }

            Spacer()
        }
        .padding()
    }
}
