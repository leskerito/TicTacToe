//
//  GameState.swift
//  TicTacToe
//
//  Created by Franck Kindia on 19/06/2024.
//

import Foundation

class GameState: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn = Tile.circle
    @Published var winner = ""
    @Published var alert = false
    
    init() {
        resetBoard()
    }
    
    func placeTile(_ row: Int, _ column: Int){
        if(board[row][column].tile != Tile.empty){
            return
        }
        
        board[row][column].tile = turn
        //Checking if the game is over...
        if checkWinner(){
            alert = true
            winner = turn == Tile.cross ? "Cross wins!" : "Circle Wins"
        } else if checkDraw() {
            alert = true
            winner = "Draw..."
        } else {
            //...before updating the game
            turn = turn == Tile.cross ? Tile.circle : Tile.cross
        }
    }
    
    func whoseTurn() -> String {
        turn == Tile.cross ? " X " : " O "
    }
    
    func checkState(){
        if checkWinner(){
            alert = true
            if turn == Tile.circle{
                winner = "Circle wins!"
            } else {
                winner = "Cross wins!"
            }
        } else if checkDraw() {
            winner = "Draw..."
            alert = true
        }
    }
    
    func checkDraw() -> Bool{
        for row in 0...2 {
            for column in 0...2 {
                if board[row][column].tile == Tile.empty{
                    return false
                }
            }
        }
        return true
    }
    
    func declareWinner(_ winner: Tile) -> String{
        if turn == Tile.circle {
            return "Circle"
        } else {
            return "Cross"
        }
    }
    
    func isTurnTile(_ row: Int, _ column: Int) -> Bool {
        return board[row][column].tile == turn
    }
    
    func checkWinner() -> Bool {
        // Vertical check
        if board[0][0].tile == turn && board[1][0].tile == turn && board[2][0].tile == turn {
            return true
        }
        if board[0][1].tile == turn && board[1][1].tile == turn && board[2][1].tile == turn {
            return true
        }
        if board[0][2].tile == turn && board[1][2].tile == turn && board[2][2].tile == turn {
            return true
        }

        // Horizontal check
        if board[0][0].tile == turn && board[0][1].tile == turn && board[0][2].tile == turn {
            return true
        }
        if board[1][0].tile == turn && board[1][1].tile == turn && board[1][2].tile == turn {
            return true
        }
        if board[2][0].tile == turn && board[2][1].tile == turn && board[2][2].tile == turn {
            return true
        }

        // Diagonal check
        if board[0][0].tile == turn && board[1][1].tile == turn && board[2][2].tile == turn {
            return true
        }
        if board[0][2].tile == turn && board[1][1].tile == turn && board[2][0].tile == turn {
            return true
        }
        return false
    }

    
    func resetBoard(){
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(tile: Tile.empty))
            }
            newBoard.append(row)
        }
        board = newBoard
        winner = ""
    }
}
