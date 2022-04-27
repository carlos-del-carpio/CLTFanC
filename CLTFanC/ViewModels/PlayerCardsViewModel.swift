//  PlayersViewModel.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/20/22.

import Foundation
import Firebase

extension ContentView {
    @MainActor class PlayerCardsViewModel: ObservableObject {
        @Published var players: [Player] = [Player]()
        @Published var playerCards: [PlayerCard] = [PlayerCard]()
        @Published var playerCardsMini: [PlayerCardMini] = [PlayerCardMini]()
        
        init() {
            self.getPlayers()
        }
        
        func getPlayers() {
            let db = Firestore.firestore()
            
            db.collection("players").addSnapshotListener { querySnapshot, error in
                guard let query = querySnapshot else {
                    print("error fetching query: \(String(describing: error))")
                    return
                }
                
                let documents = query.documents
                self.players.removeAll()
                
                for document in documents {
                    let data = document.data()
                    self.players.append(Player(data: data))
                }

                self.getPlayerCards()
            }
        }
        
        
        func getPlayerCards() {
            self.playerCards.removeAll()
            self.playerCardsMini.removeAll()
            
            for player in players {
                let newPlayerCard = PlayerCard(player: player)
                let newPlayerCardMini = PlayerCardMini(player: player)
                self.playerCards.append(newPlayerCard)
                self.playerCardsMini.append(newPlayerCardMini)
            }
        }
    }
}
