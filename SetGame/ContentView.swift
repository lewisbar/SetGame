//
//  ContentView.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    let cardAspectRatio: CGFloat = 2/3
    let cardPadding: CGFloat = 0
    let gridPadding: CGFloat = 4
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    let gridItem = GridItem(.flexible())
                    let columnCount = columnCount(numberOfCards: viewModel.table.count, size: geometry.size)
                    LazyVGrid(columns: [GridItem](repeating: gridItem, count: columnCount)) {
                        ForEach(viewModel.table, id: \.self) { card in cardView(for: card, aspectRatio: cardAspectRatio, cardPadding: cardPadding) }
                    }.padding(gridPadding)
                }
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
    private func cardView(for card: Game.Card, aspectRatio: CGFloat, cardPadding: CGFloat) -> some View {
        CardView(
            number: card.number,
            shape: card.shape,
            shading: card.shading,
            color: card.color,
            isSelected: card.isSelected,
            isPartOfWrongSet: card.isPartOfWrongSet
        ).aspectRatio(aspectRatio, contentMode: .fit)
            .padding(cardPadding)
            .onTapGesture { viewModel.pick(card) }
    }
    
    private func columnCount(numberOfCards: Int, size: CGSize) -> Int {
        switch numberOfCards {
        case 3:
            return 3
        case 6:
            return 3
        case 9:
            return 3
        case 12:
            return 4
        case 15:
            return size.width / 5 >= 80 ? 5 : 4
        case 18:
            return size.width / 6 >= 80 ? 6 : (size.width / 5 >= 80 ? 5 : 4)
        case 21:
            return size.width / 7 >= 80 ? 7 : (size.width / 6 >= 80 ? 6 : (size.width / 5 >= 80 ? 5 : 4))
        default:
            return Int(size.width / 80)
        }
    }
//
//    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat, itemPadding: CGFloat, marginPadding: CGFloat) -> CGFloat {
//        print(size.width)
//        print(size.height)
//        var columnCount = 1
//        var rowCount = itemCount
//        repeat {
//            let itemWidth = size.width / CGFloat(columnCount) + itemPadding * 2
//            let itemHeight = itemWidth / itemAspectRatio + itemPadding * 2
//            print(itemWidth)
//            print(itemHeight)
//            if  CGFloat(rowCount) * itemHeight < size.height {
//                break
//            }
//            columnCount += 1
//            rowCount = (itemCount + (columnCount - 1)) / columnCount
//        } while columnCount < itemCount
//        if columnCount > itemCount {
//            columnCount = itemCount
//        }
//        return floor(size.width / CGFloat(columnCount))
//    }
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
