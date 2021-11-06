//
//  ExerciseHList.swift
//  Spok
//
//  Created by Emilio on 06/11/21.
//

import SwiftUI

struct ExerciseHList: View {
    var body: some View {
        VStack {
            Text("My Task")
                .font(.title)
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 20) {
                    CounterView()
                    CounterView()
                }
            }
        }
    }
}

struct ExerciseHList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseHList()
            .previewLayout(.sizeThatFits)
    }
}
