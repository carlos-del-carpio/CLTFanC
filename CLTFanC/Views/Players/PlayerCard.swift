//  PlayerCard.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/15/22.
import SwiftUI


struct PlayerCard: View {
    var id = UUID()
    var player: Player
    
    
    var body: some View {
        ZStack {
            background
            number
            image
            playerDetails
        }
    }
    
    var background: some View {
        LinearGradient(colors: [Color("CLTBlue"), .black], startPoint: .top, endPoint: .bottom)
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
    }
    
    
    var number: some View {
        VStack {
            HStack {
                Spacer()
                Text("\(player.kitNumber)")
                    .font(.system(size: 150))
                    .monospacedDigit()
                    .kerning(player.kitNumber > 9 ? -30 : 0)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }.frame(width: 200, height: 100, alignment: .bottomTrailing)
        }.frame(width: 200, height: 200)
    }
        
    
    var image: some View {
        VStack {
            HStack {
                Image("\(player.imageName)")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 150,
                           height: 150,
                           alignment: .leading
                    )
            }.frame(width: 200, height: 200, alignment: .leading)
                .padding(.bottom, 40)
                .padding(.trailing, 50)
        }.frame(width: 200, height: 200)
            .clipped()
    }
    
    
    var playerDetails: some View {
        VStack{
            Spacer()
            ZStack{
                Color("box")
                    .frame(width: 200, height: 50)
                    .clipped()
                
                HStack {
                    VStack {
                        Text("\(player.firstName) \(player.lastName)")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .scaledToFit()
                            .minimumScaleFactor(0.01)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                        
                        Text("\(player.primaryPosition)")
                            .font(.caption)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    player.currentMVP ? addMVPCrown : nil
                }
            }
        }
        .frame(width: 200, height: 200)
        .cornerRadius(10)
    }


    var addMVPCrown: some View {
         Image("crown")
            .resizable()
            .scaledToFit()
            .frame(width: 35, height: 35)
            .padding(.trailing, 5)
            .padding(.leading, 0)
    }
}


struct PlayerCard_Previews: PreviewProvider {
    static var previews: some View {
        let newPlayer = Player(data: ["firstName" : "Jordi",
                                      "lastName" : "Alcívar",
                                      "middleName" : "",
                                      "imageName" : "jordi_alcivar",
                                      "kitNumber" : 8,
                                      "primaryPosition" : "Midfielder",
                                      "primaryPositionAvb" : "CM",
                                      "currentMVP" : true])
        PlayerCard(player: newPlayer)
    }
}
