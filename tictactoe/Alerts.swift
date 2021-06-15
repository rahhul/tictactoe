//
//  Alerts.swift
//  tictactoe
//
//  Created by Rahul on 15/6/21.
//

import SwiftUI


struct AlertItem: Identifiable {
    
    let id = UUID()
    
    var title: Text
    var message: Text
    var buttonTitle: Text
    
    
}


struct AlertContext {
    static let humanWin: AlertItem = AlertItem(title: Text("You win!"),
                                               message: Text("You are so smart. You beat it!"),
                                               buttonTitle: Text("Hell Yeah!"))
    
    static let computerWin: AlertItem = AlertItem(title: Text("You lost!"),
                                                  message: Text("You are dumb!"),
                                                  buttonTitle: Text("Rematch!"))
    
    static let draw: AlertItem =        AlertItem(title: Text("Draw!"),
                                                  message: Text("A battle of wits!"),
                                                  buttonTitle: Text("Try Again"))
}

