//  Team.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/26/22.

import Foundation
import FirebaseFirestoreSwift

struct Team: Codable, Identifiable {
    @DocumentID var id: String?
    var teamName: String
    var teamNameAbv: String
    var teamNameShort: String
 }
