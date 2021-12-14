//
//  SetGame.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import Foundation

struct SetGame {
    enum Number: Int, CaseIterable { case one = 1, two = 2, three = 3 }
    enum Shape: CaseIterable { case diamond, squiggle, oval }
    enum Shading: CaseIterable { case solid, striped, open }
    enum Color: CaseIterable { case red, green, purple }
    
    let cards: [Card] = {
        var cards = [Card]()
        for number in Number.allCases {
            for shape in Shape.allCases {
                for shading in Shading.allCases {
                    for color in Color.allCases {
                        cards.append(Card(number: number, Shape: shape, Shading: shading, Color: color))
                    }
                }
            }
        }
        return cards
    }()
    
    struct Card {
        let number: Number
        let Shape: Shape
        let Shading: Shading
        let Color: Color
    }
}
