//
//  CardView.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import SwiftUI

struct CardView: View {
    let number: SetGame.Number
    let shape: SetGame.Shape
    let shading: SetGame.Shading
    let color: SetGame.Color
    
    var body: some View {
//        VStack {
//            symbolView()
//                .foregroundColor(colorView as? Color)
//                .stroke()
//        }
        Text("Hello")
    }
    
//    private func symbolView<T>() -> T where T: Shape {
//        switch symbol {
//        case .diamond:
//            return DiamondShape()
//        case .squiggle:
//            return SquiggleShape()
//        case .oval:
//            return Ellipse()
//        }()
//    }
//    
//    @ViewBuilder
//    private var colorView: some View {
//        switch hue {
//        case .red:
//            Color(.red)
//        case .green:
//            Color(.green)
//        case .purple:
//            Color(.purple)
//        }
//    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(number: .two, shape: .diamond, shading: .solid, color: .red)
    }
}
