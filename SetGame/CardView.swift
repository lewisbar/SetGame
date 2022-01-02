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
    let aspectRatio: CGFloat
    var yRotation: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let lineWidth = geometry.size.width / 40
            let padding = geometry.size.width / 10
            let cornerRadius = geometry.size.width / 10
            
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
                    .foregroundColor(isSelected ? (isPartOfWrongSet ? .red : .gray) : .white)
                VStack {
                    Spacer()
                    ForEach(0..<number.rawValue, id: \.self) { _ in
                        shapeView(lineWidth: lineWidth)
                            .aspectRatio(3 * aspectRatio, contentMode: .fit)
                    }
                    Spacer()
                }
                // .rotation3DEffect(Angle(degrees: yRotation), axis: (x: 0, y: 1, z: 0))
                .padding(padding)
                if yRotation > 90 {
                    backside(cornerRadius: cornerRadius)
                }
            }
        }
    }

    @ViewBuilder
    private func shapeView(lineWidth: CGFloat) -> some View {
        switch shading {
        case .solid:
            ZStack {
                SetShape(shape: shape).fill().foregroundColor(colorView)
                SetShape(shape: shape).stroke().foregroundColor(colorView)
            }
        case .open:
            SetShape(shape: shape).stroke(lineWidth: lineWidth).foregroundColor(colorView)
        case .striped:
            ZStack {
                SetShape(shape: shape).fill().foregroundColor(colorView).opacity(0.2)
                SetShape(shape: shape).stroke(lineWidth: lineWidth).foregroundColor(colorView)
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
    
    @ViewBuilder
    private func backside(cornerRadius: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill()
            .foregroundColor(.red)
    }
}










struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(number: .three, shape: .squiggle, shading: .solid, color: .purple, isSelected: false, isPartOfWrongSet: false, aspectRatio: 2/3)
.previewInterfaceOrientation(.portrait)
    }
}
