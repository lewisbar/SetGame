//
//  ContentView.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                let cards = viewModel.cards
                ForEach(cards) { card in
                    cardView(for: card)
                }
            }
        }
    }
    
    @ViewBuilder
    func cardView(for card: Game.Card) -> some View {
        CardView(number: card.number, shape: card.shape, shading: card.shading, color: card.color)
            .aspectRatio(2/3, contentMode: .fit)
            .padding(4)
            .onTapGesture {
                viewModel.pick(card)
            }
    }
}












































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel(game: Game()))
    }
}
