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
    var deck: [Game.Card] { game.deck }
    var discarded: [Game.Card] { game.discarded }
    var score: Int { game.score }
    var canDealMore: Bool { game.canDealMore }
    
    init(game: Game) {
        self.game = game
        self.game.start()
    }
    
    func pick(_ card: Game.Card) {
        game.pick(card)
    }
    
    func deal() {
        game.deal(3)
    }
    
    func newGame() {
        game.start()
    }
}
