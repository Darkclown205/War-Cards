//
//  ContentView.swift
//  War Cards
//
//  Created by Sahil Narula on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "card7"
    @State var aiCard = "card13"
    
    @State var playerScore = 0
    @State var aiScore = 0
    @State var gameMessage = ""
    
    var body: some View {
        ZStack {
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(aiCard)
                    Spacer()
                }
                Spacer()
                Button(action: { deal() }, label: {
                    Image("button")
                })
                Spacer()
                Text(gameMessage)
                    .font(.headline)
                    .foregroundColor(.yellow)
                    .padding()
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("AI")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(aiScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func deal() {
        // Randomize the player's and AI's card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        let aiCardValue = Int.random(in: 2...14)
        aiCard = "card" + String(aiCardValue)
        
        // Update score
        if playerCardValue > aiCardValue {
            playerScore += 1
        } else if aiCardValue > playerCardValue {
            aiScore += 1
        }
        
        // Check for win condition
        if playerScore == 10 {
            gameMessage = "Player wins!"
            resetGame()
        } else if aiScore == 10 {
            gameMessage = "AI wins!"
            resetGame()
        }
    }
    
    func resetGame() {
        // Reset scores and game message
        playerScore = 0
        aiScore = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            gameMessage = ""
        }
    }
}

#Preview {
    ContentView()
}
