//  GameDayBanner.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/22/22.

import SwiftUI

struct GameDayBanner: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .padding(.horizontal, 16)
            .foregroundColor(Color("primary"))
            .frame(width: UIScreen.main.bounds.width, height: 60)
            .overlay(
                HStack {
                    Image(colorScheme == .light ? "crest" : "crest_mint")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 1)
                        .padding(.trailing, 5)
                    
                    Text("It's Game Day!")
                        .foregroundColor(Color("secondary"))
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Image(colorScheme == .light ? "crest" : "crest_mint")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical, 1)
                }
                .padding(.vertical, 5)
                .padding(.leading, 5)
            )
    }
}

struct GameDayBanner_Previews: PreviewProvider {
    static var previews: some View {
        GameDayBanner()
    }
}
