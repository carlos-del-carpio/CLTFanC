//
//  Team.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/26/22.
//

import Foundation
import Firebase

class Team: ObservableObject {
    var teamName: String
    var teamNameAvb: String
    var teamNameShort: String
    
    init(data: [String : Any]) {
        self.teamName = data["teamName"] as? String ?? "DEF"
        self.teamNameAvb = data["teamNameAvb"] as? String ?? "DEF"
        self.teamNameShort = data["teamNameShort"] as? String ?? "DEF"
    }
    
    init() {
        self.teamName = "DEF"
        self.teamNameAvb = "DEF"
        self.teamNameShort = "DEF"
    }
 }
