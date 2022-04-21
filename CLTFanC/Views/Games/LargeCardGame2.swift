//  LargeGameCard.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/18/22.
import SwiftUI


struct LargeGameCard2: View {
    var screenWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                gameDate
                gameDetails
                gameLocation
            }
        }
        .cornerRadius(30)
        .frame(width: screenWidth, height: 180)
//        .border(.white, width: 1)
    }
    
    
    var background : some View {
        LinearGradient(colors: [Color("CLTBlue"), .black], startPoint: .top, endPoint: .bottom)
            .frame(width: screenWidth, height: 180)
    }
    
    
    var gameDate : some View {
        Rectangle()
            .foregroundColor(.black)
            .frame(width: screenWidth, height: 30)
            .clipped()
            .overlay(
                Text("April 20 - 19:00")
                    .font(Font.custom("Albertus Nova Bold", size: 12))
                    .foregroundColor(.white)
            )
    }
    
    
    var awayTeam : some View {
        Rectangle()
            .padding(.bottom, 0)
            .overlay(
                VStack {
                    Image("crest")
                        .resizable()
                        .scaledToFit()

                    Text("CLT")
                        .font(Font.custom("Albertus Nova Bold", size: 25))
                        .foregroundColor(.white)
                }
            )
            .foregroundColor(Color.gray.opacity(0.0))
    }
    
    
    var atText : some View {
        Rectangle()
            .frame(width: 30)
            .overlay(
                Text("at")
                    .font(Font.custom("Albertus Nova Bold", size: 25))
                    .foregroundColor(.white)
            )
            .foregroundColor(Color.gray.opacity(0.0))
    }
    
    
    var homeTeam : some View {
        Rectangle()
            .padding(0.2)
            .padding(.bottom, 0)
            .overlay(
                VStack {
                    Image("greenville-crest")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 60)

                    Text("GRE")
                        .font(Font.custom("Albertus Nova Bold", size: 25))
                        .foregroundColor(.white)

                }
            )
            .foregroundColor(Color.gray.opacity(0.0))
    }
    
    
    var gameDetails : some View {
        HStack {
            awayTeam
            atText
            homeTeam
        }
    }
    
    
    var gameLocation : some View {
        Rectangle()
            .foregroundColor(.black)
            .clipped()
            .frame(width: screenWidth, height: 30)
            .overlay(
                Text("Triumph Stadium at Legacy Early College")
                    .font(Font.custom("Albertus Nova Bold", size: 12))
                    .foregroundColor(.white)
            )
    }
}


struct LargeGameCard2_Previews: PreviewProvider {
    static var previews: some View {
        LargeGameCard2()
    }
}
