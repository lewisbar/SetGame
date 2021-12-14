//
//  SquiggleShape.swift
//  SetGame
//
//  Created by Lennart Wisbar on 14.12.21.
//

import SwiftUI

struct SquiggleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(x: rect.minX, y: rect.maxY)
        
        var path = Path()
        path.move(to: start)
        path.addCurve(
            to: CGPoint(x: rect.midX, y: rect.midY + radius / 2),
            control1: CGPoint(x: rect.maxX * (1/3), y: rect.midY),
            control2: CGPoint(x: rect.maxX * (1/3), y: rect.midY)
        )
        path.addCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY),
            control1: CGPoint(x: rect.maxX * (2/3), y: rect.maxY),
            control2: CGPoint(x: rect.maxX * (2/3), y: rect.maxY)
        )
        path.addCurve(
            to: CGPoint(x: rect.midX, y: rect.midY - radius / 2),
            control1: CGPoint(x: rect.maxX * (2/3), y: rect.midY),
            control2: CGPoint(x: rect.maxX * (2/3), y: rect.midY)
        )
        path.addCurve(
            to: start,
            control1: CGPoint(x: rect.maxX * (1/3), y: rect.minY),
            control2: CGPoint(x: rect.maxX * (1/3), y: rect.minY)
        )
        
        return path
    }
}

struct SquiggleShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle().stroke(lineWidth: 4).foregroundColor(.red)
            SquiggleShape()
        }.frame(height: 400)
    }
}
