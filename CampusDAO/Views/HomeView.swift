//
//  HomeView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var authVM: AuthVM
    @ObservedObject var walletVM: WalletVM
    @ObservedObject var proposalsVM: ProposalsVM
    @ObservedObject var wc = WalletConnectService.shared

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {

                    // HEADER
                    VStack(alignment: .leading, spacing: 10) {
                        Text("CampusDAO")
                            .font(.largeTitle.bold())
                        Text(connectedAddressText)
                            .font(.subheadline)
                    }
                    .foregroundColor(.blue)

                    Divider()

                    // QUICK ACTIONS SECTION
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Quick Actions")
                            .font(.title2.bold())

                        HStack(spacing: 15) {

                            // Create Proposal
                            NavigationLink {
                                CreateProposalView()
                                    .environmentObject(proposalsVM)
                            } label: {
                                actionCard(title: "Create", icon: "plus.circle.fill")
                            }

                            // Wallet Connect
                            NavigationLink {
                                ConnectWalletView()
                                    .environmentObject(authVM)
                            } label: {
                                actionCard(title: "Wallet", icon: "wallet.pass.fill")
                            }

                        }

                        // Live Chat Link
                        NavigationLink {
                            LiveChatView(proposalId: "some_proposal_id")
                                .environmentObject(authVM)
                        } label: {
                            actionCard(title: "Live Chat", icon: "bubble.left.and.bubble.right.fill")
                        }
                    }

                    // RECENT PROPOSALS SECTION
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Recent Proposals")
                            .font(.title2.bold())

                        if proposalsVM.proposals.isEmpty {
                            Text("No proposals yet.")
                                .foregroundColor(.gray)
                        } else {
                            ForEach(proposalsVM.proposals.prefix(3)) { proposal in
                                NavigationLink {
                                    ProposalDetailView(proposal: proposal)
                                } label: {
                                    ProposalCard(proposal: proposal)
                                }
                            }
                        }

                        NavigationLink("View All →") {
                            ProposalListView().environmentObject(proposalsVM)
                        }
                        .padding(.top, 5)
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }

    private var connectedAddressText: String {
        let addr = wc.connectedAddress ?? ""
        return addr.isEmpty ? "Wallet: Not Connected" : addr
    }


    // MARK: - Card UI Component
    private func actionCard(title: String, icon: String) -> some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.white)

            Text(title)
                .foregroundColor(.white)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(Color.blue)
        .cornerRadius(16)
    }
}

