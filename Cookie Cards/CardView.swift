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
    @State private var fadeIn = false
    @State private var moveDownward = false
    @State private var moveUpward = false
    @State private var showAlert = false
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    
    var gradient = [Color(.color01), Color(.color02)]
    
    // MARK: BODY
    var body: some View {
        ZStack {
            
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
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
            .offset(y: moveDownward ? -218 : -300)
            
            Button {
                print("Tapped")
                playSound(sound: "happyCookie", type: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
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
            .offset(y: moveUpward ? 210 : 300)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(card.title),
                  message: Text(card.message),
                  dismissButton: .default(Text("I want it!"))
            )
        })
    }
}

#Preview {
    CardView(card: cardData[0])
}
