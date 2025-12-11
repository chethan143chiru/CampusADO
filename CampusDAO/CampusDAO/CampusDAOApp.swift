//
//  CampusDAOApp.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

@main
struct CampusDAOApp: App {
    @StateObject var authVM = AuthVM()
    @StateObject var proposalsVM = ProposalsVM()
    @StateObject var walletVM = WalletVM()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView(authVM: authVM, walletVM: walletVM, proposalsVM: proposalsVM)
                    .environmentObject(authVM)
                    .environmentObject(proposalsVM)
            }
        }
    }
}
