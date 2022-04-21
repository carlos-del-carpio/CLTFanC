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
            
            db.collection("players").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        self.players.append(Player(data: data))
                    }
                    
                    self.getPlayerCards()
                }
            }
        }
        
        
        func getPlayerCards() {
            for player in players {
                let newPlayerCard = PlayerCard(player: player)
                let newPlayerCardMini = PlayerCardMini(player: player)
                self.playerCards.append(newPlayerCard)
                self.playerCardsMini.append(newPlayerCardMini)
            }
        }
    }
}
