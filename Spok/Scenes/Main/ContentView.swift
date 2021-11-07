//
//  ContentView.swift
//  Spok
//
//  Created by Emilio on 05/11/21.
//

import SwiftUI

struct ContentView: View {
    
    private let days = DAYS
    private let reminders: [Reminder] = Network.getReminders()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    ExerciseHList()
                        .frame(height: 200)
                    DailyRemindersView(reminders: reminders)
                }
            }
            .navigationTitle("Esercizi Spot")
            .navigationBarItems(
                leading: HStack {
                    NavigationLink(destination: CalendarView()) {
                        Image(systemName: "square.grid.2x2")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    Text("Spok")
                        .font(.title2)
                        .bold()
                },
                trailing: Image(systemName: "bell")
                    .font(.title3)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
