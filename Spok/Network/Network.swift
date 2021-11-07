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
    
    static func getReminders(by day: WeekDay) -> [Reminder] {
        switch day.number {
        case 0:
            return [
                Reminder(
                    id: UUID().uuidString,
                    name: "Lingua allo Spot",
                    type: .spot,
                    date: "",
                    done: false
                ),
                Reminder(
                    id: UUID().uuidString,
                    name: "Sessione Esercizi 0.1",
                    type: .session,
                    date: "",
                    done: false
                )
            ]
        case 1:
            return [
                Reminder(
                    id: UUID().uuidString,
                    name: "Lingua allo Spot",
                    type: .spot,
                    date: "",
                    done: true
                ),
                Reminder(
                    id: UUID().uuidString,
                    name: "Sessione Esercizi 1.1",
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
                    name: "Sessione Esercizi 1.2",
                    type: .session,
                    date: "",
                    done: false
                )
            ]
        case 2:
            return [
                Reminder(
                    id: UUID().uuidString,
                    name: "Lingua allo Spot 2",
                    type: .spot,
                    date: "",
                    done: true
                )
            ]
        case 3...6:
            return [
                Reminder(
                    id: UUID().uuidString,
                    name: "Lingua allo Spot",
                    type: .spot,
                    date: "",
                    done: true
                ),
                Reminder(
                    id: UUID().uuidString,
                    name: "Sessione Esercizi \(day.number + 1).1",
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
                    name: "Sessione Esercizi \(day.number + 1).2",
                    type: .session,
                    date: "",
                    done: false
                )
            ]
        default:
            return []
        }
    }
}
