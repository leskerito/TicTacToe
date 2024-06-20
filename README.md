# Tic Tac Toe Game

A simple Tic Tac Toe game built with SwiftUI. The game allows two players to play against each other by taking turns to place their respective tiles (X and O) on a 3x3 board.

## Features

- Two-player mode: Players take turns to place X or O on the board.
- Displays the current player's turn.
- Detects and announces the winner when a player gets three tiles in a row (vertically, horizontally, or diagonally).
- Detects and announces a draw when all cells are filled without a winner.
- Option to reset the board and play again.

## Screenshots

![iPad1](https://github.com/leskerito/TicTacToe/blob/main/Screenshots/iPad%20Landscape.png)
![iPhone1](https://github.com/leskerito/TicTacToe/blob/main/Screenshots/iPhone%20Portrait.png)
![iPhone2](https://github.com/leskerito/TicTacToe/blob/main/Screenshots/iPhone%20Winning.png)

## How to Play

1. Player O starts the game.
2. Players take turns to tap on an empty cell to place their tile.
3. The game announces the winner when a player gets three tiles in a row, or declares a draw if all cells are filled without a winner.
4. Click "One More!" to reset the board and start a new game.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/leskerito/TicTacToe.git
2. Open the project in Xcode.
3. Build and run the project on your simulator or device.

## Shortcomings

- User Interface: The alert that announces the winner or a draw is the standard system alert, which lacks customization options such as changing its size or appearance.
- Turn Indication: The current player's turn is indicated by text, which could be enhanced with more interactive or visually appealing indicators.
- Basic Graphics: The game uses basic text elements for displaying the tiles (X and O), which could be improved with custom graphics or animations.
- Single Mode Only: The game currently supports only local two-player mode. There is no support for playing against an AI or online multiplayer.
- No Undo Option: Once a tile is placed, there is no option to undo the move. This feature might be useful for players to correct accidental taps.

License

This project is licensed under the MIT License.
