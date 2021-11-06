//
//  ReminderView.swift
//  Spok
//
//  Created by Pasquale Spisto on 06/11/21.
//

import SwiftUI

struct ReminderView: View {
    var icon: String = ""
    var title: String = "Titolo"
    var description: String = "Descrizione"

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
            Text(description)
                .font(.body)
                .foregroundColor(.white)
            Divider()
                .background(Color.white)
                HStack(spacing: 10) {
                    Button("Si") {
                        // action
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    Button("No") {
                        // action
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                }
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      alignment: .center
                    )
        }
        .fixedSize(horizontal: false, vertical: false)
        .padding(.vertical, 24)
        .padding(.horizontal, 20)
        .background(Color.blue)
        .cornerRadius(24)
        .shadow(radius: 10)
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
            .previewLayout(.sizeThatFits)
    }
}
