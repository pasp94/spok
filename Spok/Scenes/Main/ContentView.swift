//
//  ContentView.swift
//  Spok
//
//  Created by Emilio on 05/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
                .navigationBarItems(
                    leading: HStack {
                        Image(systemName: "square.grid.2x2")
                        Text("Spok")
                            .font(.title2)
                            .bold()
                            .padding(.leading)
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
