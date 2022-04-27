//
//  AllPlayersCard.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/16/22.
//

import SwiftUI

struct AllPlayersCard: View {
//    var id = UUID()
//    var playerNumber: Int
//    var playerFirstName: String
//    var playerLastName: String
//    var playerPosition: String
//    var playerImage: String
//    var currentPlayerOfTheGame: Bool
    
    var body: some View {
        ZStack {
            Background()
//            PlayerNubmber(playerNumber: playerNumber)
//            PlayerImage(imageName: playerImage)
//            PlayerDetails(firstName: playerFirstName, lastName: playerLastName, position: playerPosition, currentPlayerOfTheGame: currentPlayerOfTheGame)
        }
    }
    
    struct Background: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 200)
                .foregroundColor(Color("CLTBlue"))
        }
    }
}



//struct PlayerImage: View {
//    var imageName: String
//
//    var body: some View {
//        VStack {
//            HStack {
//                Image("\(imageName)")
//                    .resizable()
//                    .scaledToFit()
//                    .cornerRadius(10)
//                    .frame(width: 150,
//                           height: 150,
//                           alignment: .leading
//                    )
//            }.frame(width: 200, height: 200, alignment: .leading)
//                .padding(.bottom, 40)
//                .padding(.trailing, 50)
//        }.frame(width: 200, height: 200)
//            .clipped()
//    }
//}
//
//
//struct AddMVPCrown: View {
//    var body: some View {
//         Image("crown")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 35, height: 35)
//            .padding(.trailing, 5)
//            .padding(.leading, 0)
//    }
//}
//
//
//struct PlayerNubmber: View {
//    var playerNumber: Int
//
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Text("\(playerNumber)")
//                    .font(.system(size: 150))
//                    .monospacedDigit()
//                    .kerning(playerNumber > 9 ? -30 : 0)
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//            }.frame(width: 200, height: 100, alignment: .bottomTrailing)
//        }.frame(width: 200, height: 200)
//    }
//}
//
//
//struct PlayerDetails: View {
//    var firstName: String
//    var lastName: String
//    var position: String
//    var currentPlayerOfTheGame: Bool
//
//    var body: some View {
//        VStack{
//            Spacer()
//            ZStack{
//                Color("box")
//                    .frame(width: 200, height: 50)
//                    .clipped()
//
//                HStack {
//                    VStack {
//                        Text("\(firstName) \(lastName)")
//                            .font(.body)
//                            .fontWeight(.bold)
//                            .foregroundColor(.black)
//                            .scaledToFit()
//                            .minimumScaleFactor(0.01)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.leading, 10)
//
//                        Text("\(position)")
//                            .font(.caption)
//                            .foregroundColor(.black)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .padding(.leading, 10)
//                    }
//
//                    Spacer()
//                    currentPlayerOfTheGame ? AddMVPCrown(): nil
//                }
//            }
//        }.frame(width: 200, height: 200)
//            .cornerRadius(10)
//    }
//}

struct AllPlayersCard_Previews: PreviewProvider {
    static var previews: some View {
        AllPlayersCard()
    }
}
