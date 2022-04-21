//
//  Player.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/20/22.
//

import Foundation

class Player: ObservableObject {
    var firstName: String
    var lastName: String
    var middleName: String
    var imageName: String
    var kitNumber: Int
    var primaryPositionAbv: String
    var primaryPosition: String
    var currentMVP: Bool
    
    
    init(data: [String : Any]) {
        self.firstName = data["firstName"] as? String ?? ""
        self.lastName = data["lastName"] as? String ?? ""
        self.middleName = data["middleName"] as? String ?? ""
        self.imageName = data["imageName"] as? String ?? ""
        self.kitNumber = data["kitNumber"] as? Int ?? -1
        self.primaryPositionAbv = data["primaryPositionAbv"] as? String ?? ""
        self.primaryPosition = data["primaryPosition"] as? String ?? ""
        self.currentMVP = data["currentMVP"] as? Bool ?? false
    }
}
