//
//  ViewModel.swift
//  SetGame
//
//  Created by Lennart Wisbar on 14.12.21.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private var game: Game
    var table: [Game.Card] { game.table }
    
    init(game: Game) {
        self.game = game
        self.game.start()
    }
    
    func pick(_ card: Game.Card) {
        game.pick(card)
    }
}
