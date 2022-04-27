//  GamesViewModel.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/22/22.

import Foundation
import Firebase

extension ContentView {
    @MainActor class GamesViewModel: ObservableObject {
        @Published var games: [Game] = [Game]()
        @Published var gameTiles: [NextGameTile] = [NextGameTile]()
        @Published var isGameDay: Bool = false
        
        init() {
            getGames()
        }
        
        
        func getGames() {
            let db = Firestore.firestore()
            
            db.collection("games").addSnapshotListener { querySnapshot, error in
                self.gameTiles.removeAll()
                self.isGameDay = false
                
                guard let query = querySnapshot else {
                    print("error fetching query: \(String(describing: error))")
                    return
                }
                
                let documents = query.documents
                self.games.removeAll()
                
                for document in documents {
                    let data = document.data()
                    let newGame = Game(data: data)
                    
                    if newGame.isGameDay { self.isGameDay = true }
                    
                    self.games.append(newGame)
                }
                
                self.games.sort { $0.gameDate < $1.gameDate }
                
                for game in self.games {
                    self.fillGameTiles(game: game)
                }
            }
        }
        
        
        func fillGameTiles(game: Game) {
            var matchTeams: String = ""
            print("*********************")
            print(game.homeTeam.teamName)
            print("vs")
            print(game.homeTeam.teamName)
            print("*********************")
            
            if game.homeTeam.teamNameAvb == "CLT" {
                matchTeams = "CLT v \(game.awayTeam.teamNameAvb)"
            } else {
                matchTeams = "CLT @ \(game.homeTeam.teamNameAvb)"
            }
            
            if game.isGameInFuture {
                let newGameTile = NextGameTile(matchDate: game.gameDateString, matchTeams: matchTeams)
                self.gameTiles.append(newGameTile)
            }
        }
    }
}
