//
//  AddPlayer.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 5/11/22.
//

import SwiftUI
import Firebase

struct AddPlayer: View {
    @State var firstName: String = ""
    @State var middleName: String = ""
    @State var lastName: String = ""
    @State var captain: Bool = false
    @State var countryOfOrigin: String = ""
    @State var currentMVP: Bool = false
    @State var kitNumber: Int = -1
    @State var primaryPosition: String = ""
    @State var primaryPositionAbv: String = ""
    @State var imageName: String = ""
    
    var body: some View {
        Form {
            Group { //Grouped because there are more than 10 items, no real grouping was necessary
                TextField("First Name", text: $firstName)
                TextField("Middle Name", text: $middleName)
                TextField("Last Name", text: $lastName)
            }
            Toggle(isOn: $captain) { Text("Captain") }
            TextField("Country of Origin", text: $countryOfOrigin)
            Toggle(isOn: $currentMVP) { Text("Current MVP") }
            TextField("Kit Number", value: $kitNumber, formatter: NumberFormatter())
            TextField("Primary Position", text: $primaryPosition)
            TextField("Primary Position Abv", text: $primaryPositionAbv)
            TextField("Image Name", text: $imageName)
                .textInputAutocapitalization(.never)
            Button("Submit", action: { callFirebase() })
        }
    }
    
    func callFirebase() {
        let newPlayer: [String : Any] = ["firstName"          : self.firstName,
                                         "middleName"         : self.middleName,
                                         "lastName"           : self.lastName,
                                         "captain"            : self.captain,
                                         "countryOfOrigin"    : self.countryOfOrigin,
                                         "currentMVP"         : self.currentMVP,
                                         "kitNumber"          : self.kitNumber,
                                         "primaryPosition"    : self.primaryPosition,
                                         "primaryPositionAbv" : self.primaryPositionAbv,
                                         "imageName"          : self.imageName
                                        ]

        let db = Firestore.firestore().collection("players")
        db.addDocument(data: newPlayer)

        print("First Name: \(self.firstName)")
        print("Middle Name: \(self.middleName)")
        print("Last Name: \(self.lastName)")
        print("Captain: \(self.captain)")
        print("Country of Origin: \(self.countryOfOrigin)")
        print("Current MVP: \(self.currentMVP)")
        print("Kit Number: \(self.kitNumber)")
        print("Primary Position: \(self.primaryPosition)")
        print("Primary Position Abv: \(self.primaryPositionAbv)")
        print("Image Name: \(self.imageName)")
    }
}

struct AddPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayer(firstName: "Carlos", middleName: "", lastName: "Del Carpio", countryOfOrigin: "Peru", currentMVP: false, kitNumber: 14, primaryPosition: "Midfielder", primaryPositionAbv: "CM")
    }
}
