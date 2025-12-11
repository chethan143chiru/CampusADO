//
//  Web3Service.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class Web3Service {
    static let shared = Web3Service()
    private init() {}

    func sendVote(proposalId: String, support: Bool, from wallet: String) -> AnyPublisher<VoteReceipt, Error> {
        // simulate network + chain latency
        return Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.2) {
                let tx = VoteReceipt(txHash: UUID().uuidString.replacingOccurrences(of: "-", with: ""), success: true)
                promise(.success(tx))
            }
        }
        .eraseToAnyPublisher()
    }
}
