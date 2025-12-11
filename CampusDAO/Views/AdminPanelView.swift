//
//  AdminPanelView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct AdminPanelView: View {
    @EnvironmentObject var proposalsVM: ProposalsVM

    var body: some View {
        List {
            Section(header: Text("Admin Tools")) {
                NavigationLink("All Proposals") {
                    ProposalListView()
                        .environmentObject(proposalsVM)
                }

                NavigationLink("Analytics Dashboard") {
                    Text("Analytics Coming Soon")
                        .font(.headline)
                        .padding()
                }

                NavigationLink("User Management") {
                    Text("User Management Coming Soon")
                        .font(.headline)
                        .padding()
                }
            }
        }
        .navigationTitle("Admin Panel")
    }
}
