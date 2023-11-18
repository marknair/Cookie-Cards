//
//  ContentView.swift
//  Cookie Cards
//
//  Created by Mark Nair on 11/17/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTIES
    
    var cards = cardData
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 40) {
                ForEach(cards) { item in
                    CardView(card: item)
//                    Text("Card")
//                        .frame(width: 335, height: 545)
//                        .border(.indigo)
                }
            }
            .padding(30)
        }
    }
}

#Preview {
    ContentView()
}
