//
//  CardModel.swift
//  Cookie Cards
//
//  Created by Mark Nair on 11/18/23.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
