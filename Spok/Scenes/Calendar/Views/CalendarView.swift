//
//  CalendarView.swift
//  Spok
//
//  Created by Pasquale Spisto on 05/11/21.
//

import SwiftUI

struct CalendarView: View {

    @State var selectedDay: WeekDay?

    private let days = DAYS
    private let reminders: [Reminder] = Network.getReminders()

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    WeekView(days: days)
                        .frame(height: geometry.size.height * 0.25)
                    DailyRemindersView(reminders: reminders)
                }
            }
            .navigationTitle(
                Text("Questa settimana")
            )
        }
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
        VStack(spacing: 12) {
            ForEach(reminders) { rem in
                SpotReminderView(title: rem.name)
            }
        }
        .padding()
    }
}
