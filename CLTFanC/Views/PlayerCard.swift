//  PlayerCard.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/15/22.
import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI


struct PlayerCard: View {
    var id = UUID()
    var player: Player
    @State private var imageURL = URL(string: "")
    
    
    var body: some View {
        ZStack {
            background
            number
            image
            playerDetails
        }
    }
    
    
    var background: some View {
        LinearGradient(colors: [Color("primary"), Color("secondary")], startPoint: .top, endPoint: .bottom)
            .frame(width: 200, height: 200)
            .cornerRadius(20)
    }
    
    
    var number: some View {
        VStack {
            HStack {
                Spacer()
                Text("\(player.kitNumber)")
                    .font(.system(size: 150))
                    .monospacedDigit()
                    .kerning(player.kitNumber > 9 ? -30 : 0)
                    .foregroundColor(Color("secondary"))
                    .fontWeight(.bold)
            }
            .frame(width: 200, height: 100, alignment: .bottomTrailing)
        }
        .frame(width: 200, height: 200)
    }
        
    
    var image: some View {
        VStack {
            HStack {
                WebImage(url: imageURL)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width: 150,
                           height: 150,
                           alignment: .leading
                    )
                    .onAppear(perform: loadImageFromFirebase)
            }
            .frame(width: 200, height: 200, alignment: .leading)
            .padding(.bottom, 40)
            .padding(.trailing, 50)
        }
        .frame(width: 200, height: 200)
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
        .cornerRadius(20)
    }


    var addMVPCrown: some View {
         Image("crown")
            .resizable()
            .scaledToFit()
            .frame(width: 35, height: 35)
            .padding(.trailing, 5)
            .padding(.leading, 0)
    }
    
    
    func loadImageFromFirebase() {
        let storage = Storage.storage().reference().child("/players/charlotte_fc/\(player.imageName).png")
        
        storage.downloadURL { url, error in
            if let error = error {
                print("\(error)")
                return
            }
            
            self.imageURL = url!
        }
    }
}


struct PlayerCard_Previews: PreviewProvider {
    static var previews: some View {
        let newPlayer = Player(firstName: "Jordi", lastName: "Alcívar", middleName: "", imageName: "jordi_alcivar", kitNumber: 8, primaryPositionAbv: "MF", primaryPosition: "Midfielder", currentMVP: false, countryOfOrigin: "Ecuador", captain: false)
        PlayerCard(player: newPlayer).preferredColorScheme(.dark)
    }
}
