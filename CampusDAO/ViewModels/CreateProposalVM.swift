//
//  CreateProposalVM.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class CreateProposalVM: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var isSubmitting = false

    private var cancellables = Set<AnyCancellable>()

    func isValid() -> Bool {
        return !title.trimmingCharacters(in: .whitespaces).isEmpty &&
               !description.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func submit(user: User, proposalsVM: ProposalsVM, completion: @escaping () -> Void) {
        guard isValid() else { return }
        isSubmitting = true

        proposalsVM.createProposal(title: title, description: description, by: user) {
            DispatchQueue.main.async {
                self.isSubmitting = false
                self.title = ""
                self.description = ""
                completion()
            }
        }
    }
}
