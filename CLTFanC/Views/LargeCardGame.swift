//  LargeGameCard.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/18/22.
import SwiftUI
import Firebase
import FirebaseStorage
import SDWebImageSwiftUI


struct LargeGameCard: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var awayTeamCrestImageURL = URL(string: "")
    @State private var cltCrestImageURL = URL(string: "")
    var game: Game?
    var screenWidth = UIScreen.main.bounds.width - 32
    
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                gameDetails
                gameLocation
                gameDate
            }
        }
        .cornerRadius(30)
        .frame(width: screenWidth, height: 150)
    }
    
    
    var background : some View {
        LinearGradient(colors: [Color("primary"), Color("secondary")], startPoint: .top, endPoint: .bottom)
            .frame(width: screenWidth, height: 150)
    }
    
    
    var gameDetails : some View {
        HStack {
            Image(colorScheme == .light ? "crest" : "crest_mint")
                .resizable()
                .scaledToFit()
                .padding([.leading])

            Text(game?.awayTeam == "CLT" ? "\(game!.awayTeam)" : "\(game!.homeTeam)")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.heavy)
            
            Text(game?.homeTeam == "CLT" ? "vs" : "at")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(game?.awayTeam == "CLT" ? "\(game!.homeTeam)" : "\(game!.awayTeam)")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.heavy)
            
            WebImage(url: awayTeamCrestImageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding([.trailing])
                .foregroundColor(.black)
                .onAppear(perform: loadAwayImageFromFirebase)
        }
        .padding(.top)
    }
    
    
    var gameLocation : some View {
        Text("\(game!.stadium)")
            .fontWeight(.bold)
            .font(.caption)
    }
    
    
    var gameDate : some View {
        Text("\(game!.gameDateStringLong)")
            .font(.caption2)
            .padding(.bottom)
    }
    
    
    func loadAwayImageFromFirebase()  {
        let storage = Storage.storage().reference().child("/crests/\(game!.oppositeTeamCrest).png")
        
        storage.downloadURL { url, error in
            if let error = error {
                print("\(error)")
                return
            }
            
            self.awayTeamCrestImageURL = url!
        }
    }
}


struct LargeGameCard_Previews: PreviewProvider {
    static func getGameDate() -> Game {
        let gameDate = "May 11, 2022 18:30"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm"
        let date = dateFormatter.date(from: gameDate)!
        
        return Game(gameDate: date, stadium: "City Stadium", homeTeam: "RIC", awayTeam: "CLT", oppositeTeamCrest: "richmond_kickers_crest")
    }
    
    static var previews: some View {
        LargeGameCard(game: getGameDate())
    }
}
