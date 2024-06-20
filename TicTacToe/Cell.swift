//
//  Cell.swift
//  TicTacToe
//
//  Created by Franck Kindia on 19/06/2024.
//

import Foundation
import SwiftUI

struct Cell {
    var tile: Tile
    
    func displayTile() -> String {
        switch(tile){
            case Tile.circle:
                return "O"
            case Tile.cross:
                return "X"
            default:
                return ""
        }
    }
    
    func colorTile() -> Color {
        switch(tile){
            case Tile.circle:
                return Color.red
            default:
                return Color.black
        }
    }
}

enum Tile {
    case circle
    case cross
    case empty
}
