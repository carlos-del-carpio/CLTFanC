//
//  Game.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/22/22.
//

import Foundation
import Firebase

class Game: ObservableObject {
    var gameDate: Date
    var gameDateString: String = ""
    var isGameDay: Bool = false
    var isGameInFuture: Bool = false
    var homeTeam: Team = Team()
    var awayTeam: Team = Team()
    
    init(data: [String : Any]) {
        self.gameDate = data["gameDate"] as? Date ?? Date.init(timeIntervalSince1970: 0)
        getTeamValue(data: data, teamLocation: "homeTeam")
        getTeamValue(data: data, teamLocation: "awayTeam")
        getGameDateValues(data: data)
    }
    
    func getGameDateValues(data: [String : Any]) {
        guard let date = data["gameDate"] as? Firebase.Timestamp else {
            print("date nil")
            return
        }
        
        let dateValue = date.dateValue()
        let trueDate = Date(timeIntervalSince1970: dateValue.timeIntervalSince1970)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd HH:mm"
        
        if Calendar.current.isDateInToday(trueDate) { self.isGameDay = true }
        if trueDate > Date.now { self.isGameInFuture = true }
        self.gameDateString = dateFormatter.string(from: trueDate)
        self.gameDate = trueDate
    }
    
    
    func getTeamValue(data: [String : Any], teamLocation: String) {
        var returnTeam: Team?
        
        DispatchQueue.global().async {
            print("in the async function ")
            if let team = data[teamLocation] as? DocumentReference {
                let storage = Firestore.firestore().collection(team.parent.collectionID).document(team.documentID)
                
                storage.addSnapshotListener { document, error in
                    if error != nil {
                        print("error getting team document")
                        return
                    }
                    
                    if let document = document {
                        guard let data = document.data() else {
                            print("data could not be retrieved")
                            return
                        }
                        
                        DispatchQueue.main.async {
                            print("in the main thread ")
                            returnTeam = Team(data: data)
                            print(returnTeam?.teamName)
                            if teamLocation == "homeTeam" {
                                self.homeTeam = returnTeam!
                            } else {
                                self.awayTeam = returnTeam!
                            }
                        }
                    }
                print("out of the async function")
                }
            }
        }
    }
}
