//  ContentView.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/14/22.
import SwiftUI
import Firebase


struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var gamesViewModel: GamesViewModel
    @EnvironmentObject var playersViewModel: PlayersViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if (gamesViewModel.isGameDay()) { GameDayBanner() }
                
                Text("Next Games")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.leading)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                if gamesViewModel.getNextGame() != nil {
                    LargeGameCard(game: gamesViewModel.getNextGame())
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(gamesViewModel.games, id: \.id) { game in
                            if game.gameDate > Calendar.current.startOfDay(for: Date.now) {
                                NextGameTile(matchDate: game.gameDateString, matchTeams: game.matchTeams)
                            }
                        }
                        
                        viewFullSchedule
                    }
                    .padding()
                }
                
                Text("Captains")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.leading)
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(playersViewModel.players, id: \.id) { player in
                            if player.captain { PlayerCard(player: player) }
                        }
                        
                        NavigationLink(destination: SquadView()
                            .navigationTitle("Squad")
                            .navigationBarTitleDisplayMode(.automatic)
                                       , label: { viewFullSquad })
                    }
                }
                .cornerRadius(20)
                .padding(.horizontal)
                
                NavigationLink(destination: AddPlayer(), label: { Text("Add Player") })
                
                
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack {
//                            ForEach(playersViewModel.playerCardsMini, id: \.id) { playerCardMini in
//                                playerCardMini
//                            }
//                            
//                            ForEach(playersViewModel.playerCardsMini, id: \.id) { playerCardMini in
//                                playerCardMini
//                            }
//                        }
//                    }
//                    .cornerRadius(10)
//                    .padding(.horizontal)
                    
                Spacer()
            }
            .navigationTitle("Charlotte FC")
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
            .environmentObject(GamesViewModel())
            .environmentObject(PlayersViewModel())
        ContentView().preferredColorScheme(.light)
            .environmentObject(GamesViewModel())
            .environmentObject(PlayersViewModel())
    }
}
