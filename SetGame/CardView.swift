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
        VStack {
            ForEach(0..<number.rawValue) { _ in
                shapeView
                    .aspectRatio(2, contentMode: .fit)
                    .padding()
            }
        }
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

    @ViewBuilder
    private var shapeView: some View {
        switch shading {
        case .solid:
            SetShape(shape: shape).fill().foregroundColor(colorView)
        case .open:
            SetShape(shape: shape).stroke(lineWidth: 4).foregroundColor(colorView)
        case .striped:
            ZStack {
                SetShape(shape: shape).fill().foregroundColor(colorView).opacity(0.2)
                SetShape(shape: shape).stroke(lineWidth: 4).foregroundColor(colorView)
            }
        }
    }
    
    private var colorView: Color {
        switch color {
        case .red:
            return Color(.red)
        case .green:
            return Color(.green)
        case .purple:
            return Color(.purple)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(number: .three, shape: .squiggle, shading: .open, color: .purple)
.previewInterfaceOrientation(.portrait)
    }
}
