//
//  CalendarHelper.swift
//  Spok
//
//  Created by Pasquale Spisto on 07/11/21.
//

import Foundation

struct CalendarHelper {

    private static let weekDaysName = [
        1: "Domenica",
        2: "Lunedi",
        3: "Martedì",
        4: "Mercoledì",
        5: "Giovedì",
        6: "Venerdì",
        7: "Sabato"
    ]

    static var currentDayIndex: Int {
        let today = Calendar.current.startOfDay(for: Date())
        let dayOfWeek = Calendar.current.component(.weekday, from: today)

        return dayOfWeek - 1
    }


    static var daysOfCurrentWeek: [WeekDay] {
        let today = Calendar.current.startOfDay(for: Date())
        let dayOfWeek = Calendar.current.component(.weekday, from: today)
        guard let weekdays = Calendar.current.range(of: .weekday, in: .weekOfYear, for: today) else {
            return []
        }

        let days = (weekdays.lowerBound ..< weekdays.upperBound)
            .compactMap { Calendar.current.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
            //.filter { !calendar.isDateInWeekend($0) }

        return days.compactMap({
            let numberOfDay = Calendar.current.component(.day, from: $0)
            let dayOfWeek = Calendar.current.component(.weekday, from: $0)

            return WeekDay(number: numberOfDay, name: weekDaysName[dayOfWeek]!)
        })
    }
}
