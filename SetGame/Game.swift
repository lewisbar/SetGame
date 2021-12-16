//
//  SetGame.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import Foundation

struct Game {
    enum Number: Int, CaseIterable { case one = 1, two = 2, three = 3 }
    enum Shape: String, CaseIterable { case diamond, squiggle, oval }
    enum Shading: String, CaseIterable { case solid, striped, open }
    enum Color: String, CaseIterable { case red, green, purple }
    
    var cards: [Card] = {
        var cards = [Card]()
        var index = 0
        for number in Number.allCases {
            for shape in Shape.allCases {
                for shading in Shading.allCases {
                    for color in Color.allCases {
                        cards.append(Card(number: number, shape: shape, shading: shading, color: color, index: index))
                        index += 1
                    }
                }
            }
        }
        return cards
    }()
    
    var deck: [Card] { cards.filter { $0.isActive && !$0.isOnTable } }
    var table: [Card] { cards.filter { $0.isOnTable }.sorted { $0.tableIndex! < $1.tableIndex! }  }
    var selection: [Card] { cards.filter { $0.isSelected } }
    var score = 0
    
    mutating func start() {
        shuffle()
        deal(12)
    }
    
    mutating func shuffle() {
        var shuffledCards = cards.shuffled()
        for i in shuffledCards.indices {
            shuffledCards[i].index = i
        }
        cards = shuffledCards
    }
    
    mutating func deal(_ amount: Int) {
        for _ in 0..<amount {
            if let nextCard = deck.first {
                cards[nextCard.index].tableIndex = table.count
            }
        }
    }
    
    mutating func pick(_ card: Card) {
        switch selection.count {
        case 2:
            guard !card.isSelected else {
                cards[card.index].isSelected = false
                break
            }
            cards[card.index].isSelected = true
            if isASet(selection) {
                score += 1
                replaceSet()
                print("You found a set. New score: \(score).")
            } else {
                print("Not a set")
            }  // TODO: Penalty if wrong?
        case 3...:
            for selectedCard in selection { cards[selectedCard.index].isSelected = false }
            cards[card.index].isSelected = true
        default:
            cards[card.index].isSelected.toggle()
        }
    }
    
    mutating func replaceSet() {
        for card in selection {
            if let nextCard = deck.first {
                cards[nextCard.index].tableIndex = card.tableIndex
            }
            cards[card.index].isActive = false
        }
    }
    
    mutating func isASet(_ selection: [Card]) -> Bool {
        let isNumberSet = selection.allSatisfy({ $0.number == selection[0].number }) || Set([selection[0].number, selection[1].number, selection[2].number]) == Set(Game.Number.allCases)
        let isShapeSet = selection.allSatisfy({ $0.shape == selection[0].shape }) || Set([selection[0].shape, selection[1].shape, selection[2].shape]) == Set(Game.Shape.allCases)
        let isShadingSet = selection.allSatisfy({ $0.shading == selection[0].shading }) || Set([selection[0].shading, selection[1].shading, selection[2].shading]) == Set(Game.Shading.allCases)
        let isColorSet = selection.allSatisfy({ $0.color == selection[0].color }) || Set([selection[0].color, selection[1].color, selection[2].color]) == Set(Game.Color.allCases)
        return isNumberSet && isShapeSet && isShadingSet && isColorSet
    }
    
    struct Card: Hashable {
        let number: Number
        let shape: Shape
        let shading: Shading
        let color: Color
        var index: Int
        var tableIndex: Int?
        var isOnTable: Bool { tableIndex != nil }
        var isSelected = false
        var isActive = true {
            didSet {
                tableIndex = nil
                isSelected = false
            }
        }
        
        var description: String {
            String(number.rawValue) + shape.rawValue + shading.rawValue + color.rawValue + String(index)
        }
    }
}
