//
//  SetShape.swift
//  SetGame
//
//  Created by Lennart Wisbar on 14.12.21.
//

import SwiftUI

struct SetShape: Shape {
    let shape: Game.Shape

    func path(in rect: CGRect) -> Path {
        switch shape {
        case .diamond:
            return diamond(in: rect)
        case .squiggle:
            return squiggle(in: rect)
        case .oval:
            return oval(in: rect)
        }
    }
    
    func diamond(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        
        var path = Path()
        path.addLines([top, right, bottom, left, top])
        return path
    }
    
    func squiggle(in rect: CGRect) -> Path {
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
    
    func oval(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        
        var path = Path()
        path.move(to: top)
        path.addCurve(
            to: right,
            control1: CGPoint(x: rect.midX, y: rect.minY),
            control2: CGPoint(x: rect.maxX, y: rect.minY)
        )
        path.addCurve(
            to: bottom,
            control1: CGPoint(x: rect.maxX, y: rect.maxY),
            control2: CGPoint(x: rect.midX, y: rect.maxY)
        )
        path.addCurve(
            to: left,
            control1: CGPoint(x: rect.midX, y: rect.maxY),
            control2: CGPoint(x: rect.minX, y: rect.maxY)
        )
        path.addCurve(
            to: top,
            control1: CGPoint(x: rect.minX, y: rect.minY),
            control2: CGPoint(x: rect.midX, y: rect.minY)
        )
        return path
    }
}

struct SetSymbol_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle().stroke(lineWidth: 4).foregroundColor(.red)
            SetShape(shape: .squiggle).stroke()
        }.frame(height: 250)
    }
}
