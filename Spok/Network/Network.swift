//
//  Network.swift
//  Spok
//
//  Created by Emilio on 05/11/21.
//

import Foundation

// MARK: - Network

class Network {
    static func getReminders() -> [Reminder] {
        [
            Reminder(
                id: UUID().uuidString,
                name: "Lingua allo Spot",
                type: .spot,
                date: "",
                done: true
            ),
            Reminder(
                id: UUID().uuidString,
                name: "Sessione Esercizi 1",
                type: .session,
                date: "",
                done: true
            ),
            Reminder(
                id: UUID().uuidString,
                name: "Lingua allo Spot",
                type: .spot,
                date: "",
                done: false
            ),
            Reminder(
                id: UUID().uuidString,
                name: "Sessione Esercizi 1",
                type: .session,
                date: "",
                done: false
            )
        ].shuffled()
    }
}
