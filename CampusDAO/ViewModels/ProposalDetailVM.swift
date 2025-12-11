//
//  ProposalDetailVM.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class ProposalDetailVM: ObservableObject {
    @Published var proposal: Proposal
    private var cancellables = Set<AnyCancellable>()

    init(proposal: Proposal) {
        self.proposal = proposal
    }

    func vote(support: Bool, wallet: String, onComplete: @escaping (VoteReceipt?) -> Void) {
        Web3Service.shared.sendVote(proposalId: proposal.id, support: support, from: wallet)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // ignore
            } receiveValue: { receipt in
                if receipt.success {
                    if support { self.proposal.yes += 1 } else { self.proposal.no += 1 }
                    onComplete(receipt)
                } else {
                    onComplete(nil)
                }
            }
            .store(in: &cancellables)
    }
}
