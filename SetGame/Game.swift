//
//  SetGame.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import Foundation

struct Game {
    enum Number: Int, CaseIterable { case one = 1, two = 2, three = 3 }
    enum Shape: CaseIterable { case diamond, squiggle, oval }
    enum Shading: CaseIterable { case solid, striped, open }
    enum Color: CaseIterable { case red, green, purple }
    
    let cards: [Card] = {
        var cards = [Card]()
        var id = 0
        for number in Number.allCases {
            for shape in Shape.allCases {
                for shading in Shading.allCases {
                    for color in Color.allCases {
                        cards.append(Card(number: number, shape: shape, shading: shading, color: color, id: id))
                        id += 1
                    }
                }
            }
        }
        return cards
    }()
    
    struct Card: Identifiable {
        let number: Number
        let shape: Shape
        let shading: Shading
        let color: Color
        var id: Int
    }
}
