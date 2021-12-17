//
//  CardView.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import SwiftUI

struct CardView: View {
    let number: Game.Number
    let shape: Game.Shape
    let shading: Game.Shading
    let color: Game.Color
    var isSelected: Bool
    var isPartOfWrongSet: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 4)
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 25)
                .fill()
                .foregroundColor(isSelected ? (isPartOfWrongSet ? .red : .gray) : .white)
            VStack {
                Spacer()
                ForEach(0..<number.rawValue, id: \.self) { _ in
                    shapeView
                        .aspectRatio(2, contentMode: .fit)
                }
                Spacer()
            }.padding()
        }
    }

    @ViewBuilder
    private var shapeView: some View {
        switch shading {
        case .solid:
            ZStack {
                SetShape(shape: shape).fill().foregroundColor(colorView)
                SetShape(shape: shape).stroke().foregroundColor(colorView)
            }
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
        CardView(number: .three, shape: .diamond, shading: .solid, color: .purple, isSelected: false, isPartOfWrongSet: false)
.previewInterfaceOrientation(.portrait)
    }
}
