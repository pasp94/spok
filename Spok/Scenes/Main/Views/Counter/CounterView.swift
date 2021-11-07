//
//  CounterView.swift
//  Spok
//
//  Created by Emilio on 06/11/21.
//

import SwiftUI

struct CounterView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(Color.white)
                .padding(.vertical)
                .frame(width: 50, height: 80)
                .font(.system(size: 50))
            HStack(spacing: 50) {
                VStack(alignment: .leading) {
                    Text("Spot")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(.bottom, 1)
                    Text("Fatti: 30")
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
                Image(systemName: "arrow.forward.circle.fill")
                    .foregroundColor(Color.white)
                    .font(.title)
            }
        }
        .padding(20)
        .aspectRatio(contentMode: .fill)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
            .previewLayout(.sizeThatFits)
    }
}
