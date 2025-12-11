//
//  ProposalCard.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct ProposalCard: View {
    var proposal: Proposal

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(proposal.title).font(.headline)
            Text(proposal.summary ?? (proposal.description.prefix(80) + "..."))
                .font(.subheadline).foregroundColor(.secondary)
            HStack {
                Text("Yes: \(proposal.yes)")
                Spacer()
                Text("No: \(proposal.no)")
            }.font(.caption)
        }.padding(.vertical, 8)
    }
}
