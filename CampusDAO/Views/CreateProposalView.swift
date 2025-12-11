//
//  CreateProposalView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct CreateProposalView: View {
    @EnvironmentObject var proposalsVM: ProposalsVM
    @EnvironmentObject var authVM: AuthVM
    @State private var title = ""
    @State private var description = ""
    @State private var showingAlert = false

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Proposal title", text: $title)
            }
            Section(header: Text("Description")) {
                TextEditor(text: $description).frame(minHeight: 150)
            }
            Button("Submit") {
                guard let user = authVM.currentUser else {
                    showingAlert = true
                    return
                }
                proposalsVM.createProposal(title: title, description: description, by: user) {
                    title = ""; description = ""
                }
            }
            .disabled(title.isEmpty || description.isEmpty)
        }
        .navigationTitle("Create Proposal")
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Not connected"), message: Text("Please connect a wallet first."), dismissButton: .default(Text("Ok")))
        }
    }
}

