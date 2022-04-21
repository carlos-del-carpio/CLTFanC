//  ContentView.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/14/22.

import SwiftUI
import Firebase


struct ContentView: View {
    @StateObject private var playersViewModel = PlayerCardsViewModel()
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                Text("Next Game")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                LargeGameCard2()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        NextGameCardEven(location: "A", matchDate: "APR 23 21:00", matchTeams: "COL v CLT").padding(.trailing, 6) 
                        NextGameCardEven(location: "A", matchDate: "APR 30 19:30", matchTeams: "ORL v CLT").padding(.trailing, 6)
                        NextGameCardEven(location: "H", matchDate: "MAY 07 15:30", matchTeams: "CLT v MIA").padding(.trailing, 6)
                        NextGameCardEven(location: "H", matchDate: "MAY 14 19:00", matchTeams: "CLT v MON").padding(.trailing, 6)
                        NextGameCardEven(location: "H", matchDate: "MAY 22 17:00", matchTeams: "CLT v VAN").padding(.trailing, 6)
                        NextGameCardEven(location: "A", matchDate: "MAY 29 21:30", matchTeams: "SEA v CLT").padding(.trailing, 6)
                    }
                    .padding()
                }
                
                Text("The Squad")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(playersViewModel.playerCards, id: \.id) { playerCard in
                            playerCard
                        }
                    }
                }
                .cornerRadius(10)
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
    
    var background: some View {
        ZStack {
            RadialGradient(colors: [Color("CLTBlue"), .black], center: .center, startRadius: 0, endRadius: 360)
                .ignoresSafeArea(.all)
            
            Image("crest")
                .resizable()
                .scaledToFit()
                .opacity(0.25)
                .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }.previewDevice("iPhone 13")
    }
}
