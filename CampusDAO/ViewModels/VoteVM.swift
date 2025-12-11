//
//  VoteVM.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class VoteVM: ObservableObject {
    @Published var selectedOption: Bool? = nil
    @Published var rankedChoices: [String] = []     // for ranked-choice voting
    @Published var voteWeight: Int = 1              // for quadratic voting
    @Published var delegateWallet: String? = nil    // for delegated voting
    @Published var isSubmitting = false
    @Published var resultMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()

    // YES/NO voting
    func castSimpleVote(proposalId: String, user: User, support: Bool, proposalsVM: ProposalsVM) {
        isSubmitting = true

        Web3Service.shared.sendVote(proposalId: proposalId, support: support, from: user.walletAddress)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // No fail handling for hackathon simplicity
            } receiveValue: { receipt in
                self.isSubmitting = false
                self.resultMessage = receipt.success ? "Vote recorded" : "Failed"
                proposalsVM.applyLocalVote(proposal: proposalsVM.proposals.first { $0.id == proposalId }!, support: support)
            }
            .store(in: &cancellables)
    }

    // Placeholder for Ranked Choice
    func castRankedVote() {
        resultMessage = "Ranked voting coming soon"
    }

    // Placeholder for Quadratic Vote
    func castQuadraticVote() {
        resultMessage = "Quadratic voting coming soon"
    }

    // Placeholder for Delegated Vote
    func delegateVote() {
        resultMessage = "Vote delegation coming soon"
    }
}
