//
//  IPFSService.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import Combine

class IPFSService {
    static let shared = IPFSService()
    private init() {}

    // Local in-memory dictionary simulating IPFS CIDs
    private var ipfsMockStorage: [String: String] = [:]

    // Simulate uploading text to IPFS
    func uploadText(_ text: String) -> AnyPublisher<String, Never> {
        return Future { promise in
            let cid = UUID().uuidString.replacingOccurrences(of: "-", with: "")
            self.ipfsMockStorage[cid] = text

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                promise(.success(cid))
            }
        }
        .eraseToAnyPublisher()
    }

    // Simulate retrieving content from IPFS
    func fetchText(cid: String) -> AnyPublisher<String, Never> {
        return Future { promise in
            let value = self.ipfsMockStorage[cid] ?? ""
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                promise(.success(value))
            }
        }
        .eraseToAnyPublisher()
    }
}
