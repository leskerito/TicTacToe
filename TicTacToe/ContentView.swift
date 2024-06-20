//
//  ContentView.swift
//  TicTacToe
//
//  Created by Franck Kindia on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameState = GameState()
    @State private var orientation = UIDeviceOrientation.portrait
    
    let borderSize = CGFloat(5)
    var body: some View {
        let ticTacGrid = TicTacGridView(gameState: gameState)
        let turnO = Text(gameState.soloPlay == true ? "Your Turn": "Turn: O").font(.largeTitle).bold().opacity(gameState.whoseTurn() == " O " ? 1 : 0)
        let turnX = Text("Turn: X").font(.largeTitle).bold().opacity(gameState.whoseTurn() == " X " ? 1 : 0)
        Group{
            if orientation == UIDeviceOrientation.portrait {
                VStack {
                    if gameState.soloPlay == true{
                        turnO
                        ticTacGrid
                        turnX
                            .opacity(0)
                    } else {
                        turnO
                            .rotationEffect(.degrees(180))
                        ticTacGrid
                        turnX
                    }
                }
            } else {
                HStack {
                    if gameState.soloPlay == true{
                        turnO
                        ticTacGrid
                    } else {
                        turnO
                            .rotationEffect(.degrees(-90))
                        ticTacGrid
                        turnX
                            .rotationEffect(.degrees(90))

                    }
                }
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}


#Preview {
    ContentView()
}
