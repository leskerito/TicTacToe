//
//  ContentView.swift
//  TicTacToe
//
//  Created by Franck Kindia on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameState = GameState()
    
    let borderSize = CGFloat(5)
    var body: some View {
        Text("Turn: " + gameState.whoseTurn())
            .font(.largeTitle)
            .bold()
        Spacer()
            .frame(maxHeight: 100)
        VStack (spacing: borderSize){
            ForEach(0...2, id:\.self) {
                row in
                
                HStack(spacing: borderSize){
                    ForEach(0...2, id:\.self) {
                        
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                            .font(.system(size: 90))
                            .foregroundStyle(cell.colorTile())
                            .bold()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background()
                        
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                        
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
        .alert(
            Text(gameState.winner),
            isPresented: $gameState.alert,
            presenting: gameState.winner
        ) { _ in
            Button("One More!"){
                gameState.resetBoard()
            }
        }
    }
}

#Preview {
    ContentView()
}
