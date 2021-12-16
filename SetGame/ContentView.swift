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
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    let cards = viewModel.table
                    ForEach(cards, id: \.self) { card in
                        cardView(for: card)
                    }
                }.padding()
            }
            HStack {
                Button(action: viewModel.deal) {
                    Text("Deal")
                }
                Spacer()
                Button(action: viewModel.newGame) {
                    Text("New")
                }
            }.padding()
        }
    }
    
    @ViewBuilder
    func cardView(for card: Game.Card) -> some View {
        CardView(number: card.number, shape: card.shape, shading: card.shading, color: card.color, isSelected: card.isSelected)
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
