//
//  Player.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/20/22.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseStorage
import FirebaseFirestoreSwift


struct Player: Codable, Identifiable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var middleName: String
    var imageName: String
    var kitNumber: Int
    var primaryPositionAbv: String
    var primaryPosition: String
    var currentMVP: Bool
    var countryOfOrigin: String
    var captain: Bool
}
