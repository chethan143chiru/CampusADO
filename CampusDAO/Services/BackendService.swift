//
//  BackendService.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class BackendService {
    static let shared = BackendService()
    private init() {}

    // For demo, we keep data in memory
    private var proposals: [Proposal] = []

    func fetchProposals() -> AnyPublisher<[Proposal], Never> {
        Just(proposals)
            .eraseToAnyPublisher()
    }

    func createProposal(_ p: Proposal) -> AnyPublisher<Proposal, Never> {
        var p = p
        // simple AI-summary placeholder
        p.summary = "AI Summary: " + (p.description.split(separator: " ").prefix(12).joined(separator: " ")) + "..."
        proposals.insert(p, at: 0)
        return Just(p).eraseToAnyPublisher()
    }

    func addComment(_ comment: Comment) {
        // store comments if needed — omitted for brevity
    }
}
