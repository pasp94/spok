//
//  WeekView.swift
//  Spok
//
//  Created by Pasquale Spisto on 05/11/21.
//

import SwiftUI

struct WeekView: View {
    let days: [WeekDay]

    let layout: [GridItem] = [
        GridItem(.flexible())
    ]

    @State private var selectedWeekDay: Int = 4

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: layout, spacing: 20) {
                ForEach(days) {
                    DayView(
                        number: $0.number,
                        day: $0.shortName
                    )
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
    @State var selected: Bool = false

    let number: Int
    let day: String

    var body: some View {
        VStack(spacing: 5.0) {
            Text("\(number)")
                .font(.system(size: 22))
                .fontWeight(.heavy)
            Text(day)
                .font(.system(size: 14))
                .fontWeight(.regular)
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 18)
        .background(Color.white)
        .cornerRadius(.infinity)
        .shadow(radius: 10)
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
