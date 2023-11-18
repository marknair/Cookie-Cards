//
//  CardView.swift
//  Cookie Cards
//
//  Created by Mark Nair on 11/17/23.
//

import SwiftUI

struct CardView: View {
    // MARK: PROPERTIES
    var card: Card
    var gradient = [Color(.color01), Color(.color02)]
    
    // MARK: BODY
    var body: some View {
        ZStack {
            
            Image(card.imageName)
                .offset(y: -90)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .italic()
                    .minimumScaleFactor(0.75)
            }
            .offset(y: -218)
            
            Button {
                print("Tapped")
                playSound(sound: "sound-chime", type: "mp3")
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .accentColor(.white)
                    Image(systemName: "arrow.right.circle")
                        .fontWeight(.medium)
                        .accentColor(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y: 230)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

#Preview {
    CardView(card: cardData[0])
}
