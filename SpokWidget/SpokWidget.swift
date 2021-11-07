//
//  SpokWidget.swift
//  SpokWidget
//
//  Created by Emilio on 07/11/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),
                    reminders: [
                        Reminder(
                            id: UUID().uuidString,
                            name: "Sessione Esercizi 1",
                            type: .spot,
                            date: "",
                            done: false
                        )
                    ])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), reminders: Network.getReminders(by: CalendarHelper.currentDay))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let interval = 3
        for index in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .second, value: index * interval, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, reminders: Network.getReminders(by: CalendarHelper.currentDay))
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let reminders: [Reminder]
}

struct SpokWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry
    var iconName: String {
        if entry.reminders.first?.type == .spot {
            return "mounth.fill"
        } else {
            return "clock.circle"
        }
    }
    
    var description: String {
        if entry.reminders.first?.type == .spot {
            return "Remember to put your tongue on the spot"
        } else {
            return "Remember to do you exercise session"
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image(systemName: iconName)
                    .font(.largeTitle)
                Text(entry.reminders.first?.name ?? "Spot Reminder")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .foregroundColor(Color(UIColor.label))
            if family != .systemSmall {
                Text(description)
                    .lineLimit(2)
            }
        }
        .padding(.horizontal)
        .background(.white)
        .font(.footnote)
        .foregroundColor(Color(UIColor.systemGray))
    }
}

@main
struct SpokWidget: Widget {
    let kind: String = "SpokWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SpokWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Spok")
        .description("Track your daily reminders!")
        .supportedFamilies([.systemMedium])
    }
}

struct SpokWidget_Previews: PreviewProvider {
    static var previews: some View {
        SpokWidgetEntryView(entry: SimpleEntry(date: Date(), reminders: Network.getReminders(by: CalendarHelper.currentDay)))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
