//
//  ContentView.swift
//  war-challenge
//
//  Created by Han on 20/8/21.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "back"
    @State private var cpuCard = "back"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    var body: some View {
        ZStack{
            Image("background").ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    //player card
                    VStack{
                        Text("Player").font(.headline)
                            .foregroundColor(Color.white)
                        Image(playerCard)
                    }
                    
                    Spacer()
                    //cpu card
                    VStack{
                        Text("CPU").font(.headline)
                            .foregroundColor(Color.white)
                        Image(cpuCard)
                    }
                   
                    Spacer()
                }
                Spacer()
                //deal button
                Button(action: {
                    playerCard = "back"
                    cpuCard = "back"
                    //delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        //Generate a random number between 2 and 14
                        let playerRand = Int.random(in: 2...14)
                        let cpuRand = Int.random(in: 2...14)
                        
                        //Update the cards
                        playerCard = "card" + String(playerRand)
                        cpuCard = "card" + String(cpuRand)
                        
                        //Update the score
                        if playerRand > cpuRand {
                            playerScore += 1

                        }else if cpuRand > playerRand {
                            cpuScore += 1
                        }
                        
                    }
                    

                    
                }, label: {
                    Image("dealbutton")
                })
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
