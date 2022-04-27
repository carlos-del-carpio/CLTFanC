//
//  NextGameCard.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/19/22.
//

import SwiftUI

struct NextGameCardEven: View {
    var location: String
    var matchDate: String
    var matchTeams: String
    
    var body: some View {
        ZStack {
            Color("CLTBlue")
            
            HStack {
                Text("\(location)")
                    .fontWeight(.black)
                    .font(.title)
                    .frame(width: 30, height: 40)
                    .background(.black)
//                    .padding(.trailing, 0)
                
                VStack {
                    Text("\(matchDate)")
                        .font(.caption2)
                    Text("\(matchTeams)")
                        .font(.caption)
                        .fontWeight(.heavy)
                }
                .foregroundColor(.white)
                .frame(width: 80, height: 40)
                .padding(.horizontal, 0)
            }
        }
        .foregroundColor(.white)
        .frame(width: 110, height: 40)
    }
}

struct NextGameCardEven_Previews: PreviewProvider {
    static var previews: some View {
        NextGameCardEven(location: "H", matchDate: "APR 23", matchTeams: "COL v CLT")
    }
}
