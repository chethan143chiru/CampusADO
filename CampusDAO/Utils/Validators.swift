//
//  Validators.swift
//  CampusDAO
//
//  Created by CHETHAN R on 11/15/25.
//

import Foundation

struct Validators {

    // MARK: - Empty check
    static func isNotEmpty(_ text: String) -> Bool {
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    // MARK: - Wallet address validation (mock-friendly)
    static func isValidWalletAddress(_ wallet: String) -> Bool {
        return wallet.starts(with: "0x") && wallet.count >= 8
    }

    // MARK: - Proposal title validation
    static func isValidProposalTitle(_ title: String) -> Bool {
        return isNotEmpty(title) && title.count >= 3
    }

    // MARK: - Proposal description validation
    static func isValidProposalDescription(_ desc: String) -> Bool {
        return isNotEmpty(desc) && desc.count >= 10
    }

    // MARK: - Username validation
    static func isValidName(_ name: String) -> Bool {
        let reg = "^[A-Za-z ]{3,}$"
        return NSPredicate(format: "SELF MATCHES %@", reg).evaluate(with: name)
    }

    // MARK: - Positive integer validation
    static func isPositive(_ number: Int) -> Bool {
        number > 0
    }
}
