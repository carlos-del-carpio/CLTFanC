//  Game.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/22/22.

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestoreSwift

struct Game: Codable {
    @DocumentID var id: String?
    var gameDate: Date
    var stadium: String
    var homeTeam: String
    var awayTeam: String
    
    var gameDateString: String {
        let trueDate = Date(timeIntervalSince1970: self.gameDate.timeIntervalSince1970)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd HH:mm"
        
        return dateFormatter.string(from: trueDate)
    }
    
    var matchTeams: String {
        if homeTeam == "CLT" {
            return "\(homeTeam) vs \(awayTeam)"
        }
        
        return "\(awayTeam) @ \(homeTeam)"
    }
}
