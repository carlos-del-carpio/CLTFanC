//
//  Team.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/20/22.
//

import Foundation

class Team {
    var teamName: String
    var teamNameAvb: String
    var teamNameShort: String
    
    init(data: [String : Any]) {
        self.teamName = data["teamName"] as? String ?? ""
        self.teamNameAvb = data["teamNameAvb"] as? String ?? ""
        self.teamNameShort = data["teamNameShort"] as? String ?? ""
    }
}
