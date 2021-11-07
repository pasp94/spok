//
//  ReminderView.swift
//  Spok
//
//  Created by Pasquale Spisto on 06/11/21.
//

import SwiftUI

struct SpotReminderView: View {
    var icon: String = ""
    var title: String = "Titolo"
    var description: String = "Descrizione"

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .top, spacing: 16) {
                Image(icon)
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Text(description)
                        .font(.body)
                        .foregroundColor(.white)
                }
            }
            Divider()
                .background(Color.white)
                .cornerRadius(.infinity)
            HStack(spacing: 20) {
                Button {
                    // action
                } label: {
                    Text("Sì")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Image(systemName: "hand.thumbsup.fill")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Button {
                    // action
                } label: {
                    Text("No")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Image(systemName: "hand.thumbsdown.fill")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .fixedSize(horizontal: false, vertical: false)
        .padding(.vertical, 24)
        .padding(.horizontal, 20)
        .background(Color.Secondary.normal)
        .cornerRadius(24)
        .shadow(color: Color.Secondary.normal, radius: 10)
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        SpotReminderView()
            .previewLayout(.sizeThatFits)
    }
}
