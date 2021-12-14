//
//  SetGameApp.swift
//  SetGame
//
//  Created by Lennart Wisbar on 13.12.21.
//

import SwiftUI

@main
struct SetGameApp: App {
    
    var body: some Scene {
        WindowGroup {
            let game = Game()
            let viewModel = ViewModel(game: game)

            ContentView(viewModel: viewModel)
        }
    }
}
