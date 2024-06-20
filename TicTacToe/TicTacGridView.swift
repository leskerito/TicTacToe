//
//  TicTacGridView.swift
//  TicTacToe
//
//  Created by Franck Kindia on 20/06/2024.
//

import Foundation
import SwiftUI

struct TicTacGridView: View {
    @StateObject var gameState: GameState
    @State private var orientation = UIDeviceOrientation.unknown
    
    let borderSize = CGFloat(5)
    
    var body: some View {
        
        VStack (spacing: borderSize){
            ForEach(0...2, id:\.self) {
                row in
                
                HStack(spacing: borderSize){
                    ForEach(0...2, id:\.self) {
                        
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                            .font(.system(size: orientation == UIDeviceOrientation.portrait ? 80 : 50))
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
        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    TicTacGridView(gameState: GameState())
}
