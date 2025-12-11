//
//  AuthVM.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class AuthVM: ObservableObject {
    @Published var currentUser: User? = nil
    @Published var isConnected = false

    func loginMock(name: String, wallet: String) {
        let user = User(walletAddress: wallet, name: name, role: .student)
        currentUser = user
        isConnected = true
    }

    func logout() {
        currentUser = nil
        isConnected = false
    }
}
