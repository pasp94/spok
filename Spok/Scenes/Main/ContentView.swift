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
                ScrollView(.vertical) {
                    ExerciseHList()
                        .frame(height: geometry.size.height * 0.30)
                        .padding(.leading, 20)
                    Text("Percentuale Esercizi Spot Fatti: 70%")
                    Text("Esercizi di oggi")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        
                    DailyRemindersView(reminders: reminders)
                }
                .disabled(true)
            }
            .navigationTitle("Esercizi Spot")
            .navigationBarItems(
                leading: HStack {
                    Image(systemName: "square.grid.2x2")
                        .font(.title3)
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
        ContentView()
    }
}
