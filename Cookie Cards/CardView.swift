//
//  CardView.swift
//  Cookie Cards
//
//  Created by Mark Nair on 11/17/23.
//

import SwiftUI

// MARK: PROPERTIES
var gradient = [Color("Color01"), Color("Color02")]

// MARK: BODY

struct CardView: View {
    var body: some View {
        ZStack {
            
            Image("cc")
            
            VStack {
                Text("Chocolate Chip")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .offset(y: -218)
            
            Button {
                print("Tapped")
            } label: {
                HStack {
                    Text("More".uppercased())
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .accentColor(.white)
                    Image(systemName: "arrow.right.circle")
                        .fontWeight(.medium)
                        .accentColor(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y: 230)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

#Preview {
    CardView()
}
