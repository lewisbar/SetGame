//
//  ViewModel.swift
//  SetGame
//
//  Created by Lennart Wisbar on 14.12.21.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private var game: Game
    var cards: [Game.Card] { game.cards }
    
    init(game: Game) {
        self.game = game
        self.game.shuffle()
    }
    
    func pick(_ card: Game.Card) {
        print(card.description)
    }
}
