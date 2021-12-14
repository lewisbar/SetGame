//
//  DiamondShape.swift
//  SetGame
//
//  Created by Lennart Wisbar on 14.12.21.
//

import SwiftUI

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(x: center.x, y: center.y - radius)
        let left = CGPoint(x: center.x - radius, y: center.y)
        let bottom = CGPoint(x: center.x, y: center.y + radius)
        let right = CGPoint(x: center.x + radius, y: center.y)
        
        var path = Path()
        path.move(to: start)
        path.addLines([left, bottom, right, start])
        return path
    }
}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        DiamondShape()
    }
}
