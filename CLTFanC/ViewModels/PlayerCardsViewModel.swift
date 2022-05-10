//  PlayersViewModel.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/20/22.
import Foundation
import Firebase
import FirebaseFirestoreSwift

class PlayerCardsViewModel: ObservableObject {
    @Published var players: [Player] = [Player]()
    
    init() {
        fetchPlayers()
    }
    
    func fetchPlayers() {
        let db = Firestore.firestore().collection("players")
        
        db.addSnapshotListener { querySnapshot, error in
            guard let query = querySnapshot else {
                print("error fetching query: \(String(describing: error))")
                return
            }
            
            let documents = query.documents
            self.players.removeAll()
            
            for document in documents {
                do {
                    self.players.append(try document.data(as: Player.self))
                }
                catch {
                    print("could not get player")
                }
            }
            
            self.players.sort { $0.kitNumber < $1.kitNumber }
            
            for player in self.players {
                print(player)
            }
        }
    }
}
