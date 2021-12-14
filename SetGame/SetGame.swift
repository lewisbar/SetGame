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
}