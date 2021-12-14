//
//  CardView.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import SwiftUI

struct CardView: View {
    enum Number: Int { case one = 1, two = 2, three = 3 }
    enum Shape { case diamond, squiggle, oval }
    enum Shading { case solid, striped, open }
    enum Color { case red, green, purple }
    
    let number: Number
    let shape: Self.Shape
    let shading: Shading
    let color: Self.Color
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(number: .two, shape: .diamond, shading: .solid, color: .red)
    }
}
