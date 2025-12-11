//
//  ProposalDetailView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct ProposalDetailView: View {
    @EnvironmentObject var proposalsVM: ProposalsVM
    @EnvironmentObject var authVM: AuthVM
    @StateObject var vm: ProposalDetailVM

    init(proposal: Proposal) {
        _vm = StateObject(wrappedValue: ProposalDetailVM(proposal: proposal))
    }

    @State private var isVoting = false
    @State private var voteResult: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(vm.proposal.title).font(.title2).bold()
            Text(vm.proposal.description).font(.body)
            Divider()
            Text("AI Summary").font(.headline)
            Text(vm.proposal.summary ?? "No summary available").italic()
            Divider()
            HStack {
                Button(action: {
                    guard let wallet = authVM.currentUser?.walletAddress else { return }
                    isVoting = true
                    vm.vote(support: true, wallet: wallet) { receipt in
                        isVoting = false
                        voteResult = receipt?.txHash ?? "Failed"
                        proposalsVM.applyLocalVote(proposal: vm.proposal, support: true)
                    }
                }) {
                    Text("Vote Yes")
                }.buttonStyle(.borderedProminent)

                Button(action: {
                    guard let wallet = authVM.currentUser?.walletAddress else { return }
                    isVoting = true
                    vm.vote(support: false, wallet: wallet) { receipt in
                        isVoting = false
                        voteResult = receipt?.txHash ?? "Failed"
                        proposalsVM.applyLocalVote(proposal: vm.proposal, support: false)
                    }
                }) {
                    Text("Vote No")
                }.buttonStyle(.bordered)
            }
            if isVoting { ProgressView("Submitting vote...") }
            if let r = voteResult { Text("Tx: \(r)").font(.caption).foregroundColor(.green) }
            Spacer()
        }
        .padding()
    }
}
