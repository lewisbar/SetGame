//
//  ContentView.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    let gridPadding: CGFloat = 8
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let gridItem = GridItem(.flexible())
                let aspectRatio = geometry.size.width / geometry.size.height
                let columnCount = columnCount(numberOfCards: viewModel.table.count, size: geometry.size)
                LazyVGrid(columns: [GridItem](repeating: gridItem, count: columnCount)) {
                    ForEach(viewModel.table, id: \.self) { card in
                        cardView(for: card, aspectRatio: aspectRatio)
                    }
                }.padding(gridPadding)
            }
            HStack {
                Button(action: viewModel.deal) { Text("Deal") }
                .disabled(!viewModel.canDealMore)
                Spacer()
                Text("Sets: \(viewModel.score)")
                Spacer()
                Button(action: viewModel.newGame) { Text("New") }
            }.padding([.bottom, .horizontal])
        }
    }
    
    @ViewBuilder
    private func cardView(for card: Game.Card, aspectRatio: CGFloat) -> some View {
        CardView(
            number: card.number,
            shape: card.shape,
            shading: card.shading,
            color: card.color,
            isSelected: card.isSelected,
            isPartOfWrongSet: card.isPartOfWrongSet,
            aspectRatio: aspectRatio
        ).aspectRatio(aspectRatio, contentMode: .fit)
            .onTapGesture { viewModel.pick(card) }
    }
    
    private func columnCount(numberOfCards: Int, size: CGSize) -> Int {
        Int(CGFloat(numberOfCards).squareRoot().rounded(.up))
    }
}












































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: ViewModel(game: Game()))
                .previewDevice("iPhone SE (2nd generation)")
.previewInterfaceOrientation(.portrait)
        }
    }
}
