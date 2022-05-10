//  Game.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/22/22.

import Foundation
import Firebase
import SwiftUI
import FirebaseStorage
import FirebaseFirestoreSwift

struct Game: Codable {
    @DocumentID var id: String?
    var gameDate: Date
    var stadium: String
    var homeTeam: String
    var awayTeam: String
    var oppositeTeamCrest: String
    
    
    var gameDateString: String {
        let trueDate = Date(timeIntervalSince1970: self.gameDate.timeIntervalSince1970)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd HH:mm"
        
        return dateFormatter.string(from: trueDate)
    }
    
    
    var gameDateStringLong: String {
        let trueDate = Date(timeIntervalSince1970: self.gameDate.timeIntervalSince1970)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd HH:mm"
        
        return dateFormatter.string(from: trueDate)
    }
    
    
    var matchTeams: String {
        return "\(homeTeam) vs \(awayTeam)"
    }
    
    
    func getCLTCrest(colorScheme: ColorScheme) {
        let cltCrest = colorScheme == .light ? "charlotte_fc_crest" : "charlotte_fc_crest_mint"
        let storage = Storage.storage().reference().child("/crests/\(cltCrest).png")
    }
}
