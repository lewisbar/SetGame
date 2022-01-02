//
//  ContentView.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @Namespace private var cardsNamespace
    let gridPadding: CGFloat = 8
    let cardAspectRatio: CGFloat = 2/3
    let maxDeckHeight: CGFloat = 80
    
    var body: some View {
        VStack {
            cardGrid
            HStack {
                deck
                Spacer()
                Text("Sets: \(viewModel.score)")
                Spacer()
                discarded
            }
            .padding([.bottom, .horizontal])
        }
    }
    
    @ViewBuilder
    private var cardGrid: some View {
        GeometryReader { geometry in
            let gridItem = GridItem(.flexible())
            let aspectRatio = geometry.size.width / geometry.size.height
            let columnCount = Int(CGFloat(viewModel.table.count).squareRoot().rounded(.up))
            LazyVGrid(columns: [GridItem](repeating: gridItem, count: columnCount)) {
                ForEach(viewModel.table) { card in
                    cardView(for: card, aspectRatio: aspectRatio)
                        .matchedGeometryEffect(id: card.id, in: cardsNamespace)
                        .onTapGesture { withAnimation { viewModel.pick(card) } }
                }
            }
            .padding(gridPadding)
        }
    }
    
    @ViewBuilder
    private func cardView(for card: Game.Card, aspectRatio: CGFloat, yRotation: CGFloat = 0) -> some View {
        CardView(
            number: card.number,
            shape: card.shape,
            shading: card.shading,
            color: card.color,
            isSelected: card.isSelected,
            isPartOfWrongSet: card.isPartOfWrongSet,
            aspectRatio: aspectRatio,
            yRotation: yRotation
        )
        .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    @ViewBuilder
    private var deck: some View {
        ZStack {
            ForEach(viewModel.deck.reversed()) { card in
                cardView(for: card, aspectRatio: cardAspectRatio, yRotation: 180)
                    .matchedGeometryEffect(id: card.id, in: cardsNamespace)
            }
        }
        .frame(maxHeight: maxDeckHeight)
        .onTapGesture { withAnimation { viewModel.deal() } }
    }
    
    @ViewBuilder
    private var discarded: some View {
        ZStack {
            ForEach(viewModel.discarded) { card in
                cardView(for: card, aspectRatio: cardAspectRatio)
                    .matchedGeometryEffect(id: card.id, in: cardsNamespace)
            }
        }
        .frame(maxHeight: maxDeckHeight)
        .onTapGesture { withAnimation { viewModel.newGame() } }
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
