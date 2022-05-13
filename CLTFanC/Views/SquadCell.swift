//  SquadCell.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 5/10/22.
import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct SquadCell: View {
    var player: Player
    @State private var imageURL = URL(string: "")
    
    var body: some View {
        HStack {
            WebImage(url: imageURL)
                .resizable()
                .frame(maxWidth: 80, maxHeight: 80)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding(.trailing, 10)
                .onAppear(perform: loadPlayerImageFromFirestorage)

            
            VStack (alignment: .leading) {
                HStack (spacing: 2){
                    Text("\(player.kitNumber)")
                        .font(.title2)
                        .foregroundColor(Color("primary"))
                        .fontWeight(.black)
                    
                    Text("\(player.firstName) \(player.lastName)")
                        .font(.title2)
                        .foregroundColor(Color("primary"))
                        .fontWeight(.bold)
                }
                
                Text("\(player.primaryPosition)")
                    .foregroundColor(Color("primary"))
                    .font(.subheadline)
                
                Text("\(player.countryOfOrigin)")
                    .foregroundColor(Color("primary"))
                    .font(.subheadline)
            }
            
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 100)
        .cornerRadius(15)
        .padding(.horizontal, 0)
    }
    
    
    func loadPlayerImageFromFirestorage()  {
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


struct SquadCell_Previews: PreviewProvider {
    static var previews: some View {
        let newPlayer = Player(firstName: "Jordi", lastName: "Alcívar", middleName: "", imageName: "jordi_alcivar", kitNumber: 8, primaryPositionAbv: "MF", primaryPosition: "Midfielder", currentMVP: false, countryOfOrigin: "Ecuador", captain: false)
        
        SquadCell(player: newPlayer)
    }
}
