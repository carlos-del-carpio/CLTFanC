//  ContentView.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/14/22.

import SwiftUI
import Firebase


struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var playersViewModel = PlayerCardsViewModel()
    @StateObject private var gamesViewModel = GamesViewModel()
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack {
            VStack {
                if (gamesViewModel.isGameDay) { GameDayBanner() }
                
                Text("Next Games")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                LargeGameCard()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(gamesViewModel.gameTiles, id: \.id) { gameTile in
                            gameTile
                        }
                        
                        viewFullSchedule
                    }
                    .padding()
                }
                
                Text("Squad")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.leading)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(playersViewModel.playerCards, id: \.id) { playerCard in
                            playerCard
                        }
                        viewFullSquad
                    }
                }
                .cornerRadius(20)
                .padding(.horizontal)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(playersViewModel.playerCardsMini, id: \.id) { playerCardMini in
                            playerCardMini
                        }
                        
                        ForEach(playersViewModel.playerCardsMini, id: \.id) { playerCardMini in
                            playerCardMini
                        }
                    }
                }
                .cornerRadius(10)
                .padding(.horizontal)
                    
                Spacer()
            }
        }
    }
    
    var viewFullSchedule: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(Color("primary"), lineWidth: 2)
            .frame(width: 120, height:60)
            .foregroundColor(Color("secondary"))
            .overlay(
                HStack {
                    Text("Schedule")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Image(systemName: "chevron.compact.right")
                }
            )
    }
    
    var viewFullSquad: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(Color("primary"), lineWidth: 4)
            .frame(width: 200, height: 200)
            .overlay(
                VStack {
                    Image(colorScheme == .light ? "crest" : "crest_mint")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.trailing, .leading], 30)
                    
                    Text("Squad")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("primary"))
                }
                .padding()
            )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}