//
//  WeekView.swift
//  Spok
//
//  Created by Pasquale Spisto on 05/11/21.
//

import SwiftUI

struct WeekView: View {
    let days: [WeekDay]

    @State private var selectedWeekDayIndex: Int = 0
    private let layout: [GridItem] = [
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: layout, spacing: 20) {
                ForEach(0..<days.count, id:\.self) { index in
                    let day = days[index]
                    DayView(selected: selectedWeekDayIndex == index, number: day.number, day: day.shortName)
                        .onTapGesture {
                            selectedWeekDayIndex = index
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(days: DAYS)
            .previewLayout(.sizeThatFits)
    }
}

struct DayView: View {
    var selected: Bool
    let number: Int
    let day: String

    var body: some View {
        let textColor: Color = selected ? .white : .Primary.normal
        let backgroundColor: Color = selected ? .Primary.light : .white
        let shadowColor: Color = selected ? .Primary.light : .gray

        VStack(spacing: 5.0) {
            Text("\(number)")
                .font(.system(size: 22))
                .fontWeight(.heavy)
                .foregroundColor(textColor)
            Text(day)
                .font(.system(size: 14))
                .fontWeight(.regular)
                .foregroundColor(textColor)
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 18)
        .background(backgroundColor)
        .cornerRadius(.infinity)
        .shadow(color: shadowColor, radius: 10)
    }
}


struct WeekDay: Identifiable {
    let id: UUID = UUID()
    let number: Int
    let name: String

    var shortName: String { name.prefix(3).capitalized }
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
