//  GamesViewModel.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/22/22.
import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI


class GamesViewModel: ObservableObject {
    @Published var games: [Game] = [Game]()
    
    init() {
        fetchGames()
    }
    
    private func fetchGames() {
        let db = Firestore.firestore().collection("games")
        
        db.addSnapshotListener { querySnapshot, error in
            self.games.removeAll()
            
            if let error = error {
                print("error getting games: \(String(describing: error))")
                return
            }
            
            guard let query = querySnapshot else {
                print("empty querySnapshot")
                return
            }
            
            for document in query.documents {
                do {
                    self.games.append(try document.data(as: Game.self))
                }
                catch {
                    print("could not get game")
                }
            }
            
            self.games.sort { $0.gameDate < $1.gameDate }
        }
    }
    
    func getNextGame() -> Game? {
        var returnGame: Game?
        
        for game in games {
            if game.gameDate > Calendar.current.startOfDay(for: Date.now) {
                returnGame = game
                break
            }
        }
        
        return returnGame
    }
    
    
    func isGameDay() -> Bool {
        var returnValue = false
        
        for game in games {
            if Calendar.current.isDateInToday(game.gameDate) {
                returnValue = true
            }
        }
        
        return returnValue
    }
}
