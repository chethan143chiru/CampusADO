//
//  ProposalListView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct ProposalListView: View {
    @EnvironmentObject var proposalsVM: ProposalsVM

    var body: some View {
        List {
            ForEach(proposalsVM.proposals) { p in
                NavigationLink(destination: ProposalDetailView(proposal: p).environmentObject(proposalsVM)) {
                    ProposalCard(proposal: p)
                }
            }
        }
    }
}
