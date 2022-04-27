//  LargeGameCard.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/18/22.
import SwiftUI


struct LargeGameCard: View {
    @Environment(\.colorScheme) var colorScheme
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

            Text("CLT")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.heavy)
            
            Text("at")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("GRE")
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.heavy)
            
            Image("greenville-crest")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding([.trailing])
                .foregroundColor(.black)
        }
        .padding(.top)
    }
    
    
    var gameLocation : some View {
        Text("Triumph Stadium at Legacy Early College")
            .fontWeight(.bold)
            .font(.caption)
    }
    
    
    var gameDate : some View {
        Text("April 20 19:00")
            .font(.caption2)
            .padding(.bottom)
    }
}


struct LargeGameCard_Previews: PreviewProvider {
    static var previews: some View {
        LargeGameCard()
    }
}
