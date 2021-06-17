//
//  GameView.swift
//  tictactoe
//
//  Created by Rahul on 15/6/21.
//

import SwiftUI



struct GameView: View {
    
    @StateObject private var viewModel: GameViewModel = GameViewModel()
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("welcome")
                Spacer()
                LazyVGrid(columns: viewModel.columns, spacing: 25) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? " ")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                        
                    }
                }
                Spacer()
                Button(action: {viewModel.resetGame()}, label: {
                    Text("New Game").font(.title)
                })
            }
            .disabled(viewModel.isGameboardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: {viewModel.resetGame()}))
            }
        }
    }
    
}



struct GameSquareView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(Color(red: 0.35, green: 0.3, blue: 0.8))
            .frame(width: proxy.size.width/3 - 45,
                   height: proxy.size.width/3 - 45)
    }
}


struct PlayerIndicator: View {
    
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 100, height: 100).foregroundColor(.white)
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
