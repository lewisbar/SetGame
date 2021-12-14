//
//  DiamondShape.swift
//  SetGame
//
//  Created by Lennart Wisbar on 14.12.21.
//

import SwiftUI

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        
        var path = Path()
        path.move(to: top)
        path.addLines([left, bottom, right, top])
        return path
    }
}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle().stroke(lineWidth: 4).foregroundColor(.red)
            DiamondShape()
        }.frame(height: 200)
    }
}
