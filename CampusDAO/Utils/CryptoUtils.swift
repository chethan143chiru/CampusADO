//
//  CryptoUtils.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation
import CryptoKit

struct CryptoUtils {
    static func sha256Hex(_ input: String) -> String {
        let data = Data(input.utf8)
        let hash = SHA256.hash(data: data)
        return hash.compactMap { String(format: "%02x", $0) }.joined()
    }
}
