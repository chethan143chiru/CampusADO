//
//  User.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID().uuidString
    var walletAddress: String
    var name: String
    var role: Role
}
