//
//  SetGame.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import Foundation

struct SetGame {
    enum Number: CaseIterable { case one, two, three }
    enum Shape: CaseIterable { case diamond, squiggle, oval }
    enum Shading: CaseIterable { case solid, striped, open }
    enum Color: CaseIterable { case red, green, purple }
}
