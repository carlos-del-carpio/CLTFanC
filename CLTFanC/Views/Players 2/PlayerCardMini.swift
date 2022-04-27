//
//  PlayerCardMini.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/15/22.
//

import SwiftUI

struct PlayerCardMini: View {
    var id = UUID()
    var player: Player
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("CLTBlue"))
                .frame(width: 75, height: 75)
            
            Image("crest")
                .resizable()
                .frame(width: 75, height: 75)
                .opacity(0.7)
            
            Image("\(player.imageName)")
                .resizable()
                .frame(width: 75, height: 75)
                .clipped()
            
            Text("\(player.lastName)")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding([.leading, .trailing], 3)
                .padding(.bottom, 1)
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .frame(width: 75, height: 75, alignment: .bottom)
                .shadow(color: .black, radius: 1.0)
        }.cornerRadius(10)
    }
}


struct PlayerCardMini_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            let newPlayer = Player(data: ["firstName" : "Jordi",
                                          "lastName" : "Alcívar",
                                          "middleName" : "",
                                          "imageName" : "jordi_alcivar",
                                          "kitNumber" : 8,
                                          "primaryPosition" : "Midfielder",
                                          "primaryPositionAvb" : "CM",
                                          "currentMVP" : true])
            PlayerCardMini(player: newPlayer)
        }
    }
}
