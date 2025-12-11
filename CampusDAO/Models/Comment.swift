//
//  Comment.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation

struct Comment: Identifiable, Codable {
    var id = UUID().uuidString
    var proposalId: String
    var author: String
    var text: String
    var createdAt: Date = Date()
}
