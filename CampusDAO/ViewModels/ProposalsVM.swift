//
//  ProposalsVM.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class ProposalsVM: ObservableObject {
    @Published var proposals: [Proposal] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        loadProposals()
    }

    func loadProposals() {
        BackendService.shared.fetchProposals()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] arr in
                self?.proposals = arr
            }
            .store(in: &cancellables)
    }

    func createProposal(title: String, description: String, by user: User, completion: @escaping () -> Void = {}) {
        let p = Proposal(title: title, description: description, createdBy: user.name)
        BackendService.shared.createProposal(p)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newP in
                self?.proposals.insert(newP, at: 0)
                completion()
            }
            .store(in: &cancellables)
    }

    func applyLocalVote(proposal: Proposal, support: Bool) {
        // mutate local copy
        guard let idx = proposals.firstIndex(where: { $0.id == proposal.id }) else { return }
        if support {
            proposals[idx].yes += 1
        } else {
            proposals[idx].no += 1
        }
    }
}
