//
//  ContentView.swift
//  TicTacToe
//
//  Created by Franck Kindia on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()
    @State private var orientation = UIDeviceOrientation.unknown
    
    let borderSize = CGFloat(5)
    var body: some View {
        Text("Turn: " + gameState.whoseTurn())
            .font(.largeTitle)
            .bold()
        TicTacGridView()
            .padding()
    }
}

#Preview {
    ContentView()
}
