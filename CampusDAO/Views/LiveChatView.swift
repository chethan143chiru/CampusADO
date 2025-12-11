//
//  LiveChatView.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import SwiftUI

struct LiveChatView: View {
    @EnvironmentObject var authVM: AuthVM
    @StateObject var vm = RealTimeVM()
    @State private var message = ""

    var proposalId: String

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(vm.messages) { msg in
                            VStack(alignment: .leading, spacing: 2) {
                                Text(msg.author)
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                Text(msg.text)
                                    .font(.body)
                                    .padding(8)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .id(msg.id)
                        }
                    }
                    .padding()
                }
                .onChange(of: vm.messages.count) {
                    if let last = vm.messages.last {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }

            HStack {
                TextField("Type a message…", text: $message)
                    .textFieldStyle(.roundedBorder)

                Button("Send") {
                    guard let user = authVM.currentUser else { return }
                    vm.sendMessage(text: message, proposalId: proposalId, user: user)
                    message = ""
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("Live Chat")
        .onAppear { vm.connect() }
        .onDisappear { vm.disconnect() }
    }
}
