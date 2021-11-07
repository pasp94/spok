//
//  WeekDay.swift
//  Spok
//
//  Created by Pasquale Spisto on 07/11/21.
//

import Foundation

struct WeekDay: Identifiable, Equatable {
    let id: UUID = UUID()
    let number: Int
    let name: String

    var shortName: String { name.prefix(3).capitalized }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

let DAYS = [
    WeekDay(number: 1, name: "Lunedi"),
    WeekDay(number: 2, name: "Martedì"),
    WeekDay(number: 3, name: "Mercoledì"),
    WeekDay(number: 4, name: "Giovedì"),
    WeekDay(number: 5, name: "Venerdì"),
    WeekDay(number: 6, name: "Sabato"),
    WeekDay(number: 7, name: "Domenica")
]
