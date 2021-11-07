//
//  CalendarView.swift
//  Spok
//
//  Created by Pasquale Spisto on 05/11/21.
//

import SwiftUI

struct CalendarView: View {

    private let days = DAYS
    private lazy var reminders: [[Reminder]] =  days.map { _ in
        Network.getReminders()
    }

    @State var selectedDayIndex: Int = 0

    var body: some View {
        var mutableSelf = self

        GeometryReader { geometry in
            ScrollView(.vertical) {
                WeekView(selectedWeekDayIndex: $selectedDayIndex, days: days)
                    .frame(height: geometry.size.height * 0.25)
                DailyRemindersView(reminders: mutableSelf.reminders[selectedDayIndex])
            }
        }
        .navigationTitle(
            Text("Questa settimana")
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .previewLayout(.sizeThatFits)
    }
}

struct DailyRemindersView: View {
    let reminders: [Reminder]

    var body: some View {
        VStack(spacing: 24) {
            ForEach(reminders) { rem in
                Group {
                    if rem.type == .spot {
                        SpotReminderView(title: rem.name)
                    } else {
                        SessionReminderView()
                    }
                }
            }
        }
        .padding()
    }
}
