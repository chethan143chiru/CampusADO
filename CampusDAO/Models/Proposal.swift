//
//  Proposal.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation

struct Proposal: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var createdBy: String
    var start: Date = Date()
    var end: Date = Date().addingTimeInterval(60*60*24) // 24h
    var yes: Int = 0
    var no: Int = 0
    var summary: String? = nil
}
