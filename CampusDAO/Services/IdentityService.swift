//
//  IdentityService.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class IdentityService: ObservableObject {
    static let shared = IdentityService()

    @Published var hasIdentityToken: Bool = false
    @Published var role: Role = .guest

    private init() {}

    // Mock identity verification – replace with real Web3 call later
    func checkIdentity(wallet: String, completion: @escaping (Bool, Role) -> Void) {
        // Simulate async chain call
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.8) {
            // For demo: any address gets student role
            let result = true
            let assignedRole: Role = .student

            DispatchQueue.main.async {
                self.hasIdentityToken = result
                self.role = assignedRole
                completion(result, assignedRole)
            }
        }
    }

    func registerIdentity(wallet: String, name: String, completion: @escaping (Bool) -> Void) {
        // Mock DID mint
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let minted = true
            DispatchQueue.main.async {
                self.hasIdentityToken = minted
                self.role = .student
                completion(minted)
            }
        }
    }
}
