//
//  GameModel.swift
//  tictactoe
//
//  Created by Rahul on 15/6/21.
//

import Foundation


enum Player {
    case human, computer
}



struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark": "circle"
    }
    
}
