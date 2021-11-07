//
//  WeekView.swift
//  Spok
//
//  Created by Pasquale Spisto on 05/11/21.
//

import SwiftUI

struct WeekView: View {
    @Binding var selectedWeekDayIndex: Int
    let days: [WeekDay]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 20) {
                ForEach(0..<days.count, id:\.self) { index in
                    let day = days[index]
                    DayView(
                        selected: selectedWeekDayIndex == index,
                        number: day.number,
                        day: day.shortName
                    )
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
        WeekView(
            selectedWeekDayIndex: .constant(0),
            days: DAYS
        )
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
        .aspectRatio(65/120, contentMode: .fill)
        .background(backgroundColor)
        .cornerRadius(.infinity)
        .shadow(color: shadowColor, radius: 10)
    }
}
