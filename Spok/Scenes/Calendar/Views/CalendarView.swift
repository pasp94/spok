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

//    @State var selectedDay: WeekDay?

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                WeekView(days: days)
                    .frame(height: geometry.size.height * 0.25)
                DailyRemindersView(reminders: Network.getReminders())
            }
        }
        .navigationTitle(
            Text("Questa settimana")
        )
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitleDisplayMode(.inline)
    }

//    var remindersForSelectedDay: [Reminder] {
//        var mutableSelf = self
//        guard let selectedDay = selectedDay,
//              let index = days.firstIndex(of: selectedDay)
//        else {
//            return []
//        }
//        return mutableSelf.reminders[index]
//    }
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
