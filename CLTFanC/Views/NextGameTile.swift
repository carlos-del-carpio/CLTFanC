//  NextGameTile.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/22/22.
import SwiftUI

struct NextGameTile: View {
    var id = UUID()
    var matchDate: String
    var matchTeams: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(Color("primary"), lineWidth: 2)
            .frame(width: 120, height:60)
            .foregroundColor(Color("secondary"))
            .overlay(
                VStack (spacing: -5) {
                    Text("\(matchTeams)")
                        .font(.body)
                        .fontWeight(.heavy)
                        .frame(width: 120, height: 40)
                        .padding(.top, -5)
        
                    Text("\(matchDate)")
                        .font(.caption)
                        .padding(.bottom, 5)
                }
            )
    }
}


struct NextGameTile_Previews: PreviewProvider {
    static var previews: some View {
        NextGameTile(matchDate: "APR 23 21:00", matchTeams: "COL v CLT")
        NextGameTile(matchDate: "APR 23 21:00", matchTeams: "COL v CLT").colorScheme(.dark)
    }
}
