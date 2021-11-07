//
//  ExerciseHList.swift
//  Spok
//
//  Created by Emilio on 06/11/21.
//

import SwiftUI

struct ExerciseHList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 20) {
                CounterView()
                CounterView()
            }
            .padding(.leading, 20)
        }
    }
}

struct ExerciseHList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseHList()
            .previewLayout(.sizeThatFits)
    }
}
