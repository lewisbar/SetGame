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
//
//        if isInPortraitMode(size) { return columnCountForPortraitMode(numberOfCards: numberOfCards, size: size) }
//        else { return columnCountForLandscapeMode(numberOfCards: numberOfCards, size: size)}
    }
    
//    private func isInPortraitMode(_ size: CGSize) -> Bool {
//        size.width <= size.height
//    }
//
//    private func columnCountForPortraitMode(numberOfCards: Int, size: CGSize) -> Int {
//        Int(CGFloat(numberOfCards).squareRoot().rounded(.up))
//        switch numberOfCards {
//        case 1:
//            return 1
//        case 2...4:
//            return 2
//        case 5...9:
//            return 3
//        case 10...16:
//            return 4
//        case 17...25:
//            return 5
//        case 26...36:
//            return 6
//        case 37...49:
//            return 7
//        case 50...64:
//            return 8
//        case 65...81:
//            return 9
//        default:
//            return Int(size.width / 80)
//        }
//    }
//
//    private func columnCountForLandscapeMode(numberOfCards: Int, size: CGSize) -> Int {
//        return Int(size.width / 80)
//    }
    
//    private func columnCount(numberOfCards: Int, size: CGSize) -> Int {
//        let cardCount = viewModel.table.count
//        let maxColumnCount = Int(size.width / 80)
//        let maxRowCount = Int(size.height / (80 / cardAspectRatio))
//
//        var columnCount = maxColumnCount
//        var rowCount = 1
//        var oldDifference = (maxColumnCount - columnCount) + (maxRowCount - rowCount)
//        var oldColumnCount = columnCount
//        while rowCount < maxRowCount {
//            columnCount -= 1
//            rowCount += 1
//            let newDifference = (maxColumnCount - columnCount) + (maxRowCount - rowCount)
//            if newDifference < oldDifference {
//                oldDifference = newDifference
//                oldColumnCount = columnCount
//            } else {
//                return oldColumnCount
//            }
////            if columnCount * rowCount > cardCount {
////                return columnCount - 1
////            }
//        }
//        return columnCount
//    }
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
