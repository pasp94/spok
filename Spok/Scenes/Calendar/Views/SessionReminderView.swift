//
//  SessionReminderView.swift
//  Spok
//
//  Created by Pasquale Spisto on 06/11/21.
//

import SwiftUI

struct SessionReminderView: View {

    let icon: String = ""
    let title: String = "Titolo"

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(icon)
                .frame(width: 40, height: 40)
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.Primary.normal)
        }
        .fixedSize(horizontal: false, vertical: false)
        .padding(.vertical, 24)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 10)
    }
}

struct SessionReminderView_Previews: PreviewProvider {
    static var previews: some View {
        SessionReminderView()
            .previewLayout(.sizeThatFits)

    }
}
