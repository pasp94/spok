//
//  Reminder.swift
//  Spok
//
//  Created by Emilio on 05/11/21.
//

import Foundation

// MARK: - Reminder

struct Reminder: Identifiable, Codable {
    let id: String
    let name: String
    let type: `Type`
    let date: String
    let done: Bool
}

// MARK: - Reminder Extension

extension Reminder {
    enum `Type`: String, Codable {
        case spot = "SPOT"
        case session = "SESSION"
    }
}
