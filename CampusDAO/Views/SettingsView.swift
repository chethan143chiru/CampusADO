//
//  SettingsView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authVM: AuthVM

    var body: some View {
        Form {

            Section(header: Text("Account")) {
                if let user = authVM.currentUser {
                    Text("Logged in as: \(user.name)")
                    Text("Wallet: \(user.walletAddress)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else {
                    Text("Not logged in")
                }
            }

            Section(header: Text("Preferences")) {
                Toggle("Dark Mode (System)", isOn: .constant(false))
                    .disabled(true)
                Text("More settings coming soon")
            }

            Section {
                Button("Logout") {
                    authVM.logout()
                }
                .foregroundColor(.red)
            }
        }
        .navigationTitle("Settings")
    }
}
