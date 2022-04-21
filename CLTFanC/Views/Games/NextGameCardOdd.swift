//
//  NextGameCardOdd.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/19/22.
//

import SwiftUI

struct NextGameCardOdd: View {
    var location: String
    var matchDate: String
    var matchTeams: String
    
    var body: some View {
        ZStack {
            Color(.white)
            
            HStack {
                Text("\(location)")
                    .fontWeight(.black)
                    .font(.title)
                    .padding(.leading, 3)
//                    .frame(width: 30, height: 40)
//                    .background(Color("CLTBlue"))
                
                VStack {
                    Text("\(matchDate)")
                        .font(.caption2)
                    Text("\(matchTeams)")
                        .font(.caption)
                        .fontWeight(.heavy)
                }
                .foregroundColor(.black)
                .frame(width: 80, height: 40)
//                .padding(.horizontal, 0)
            }
        }
        .foregroundColor(.black)
        .frame(width: 110, height: 40)
//        .border(.black, width: 1)
    }
}

struct NextGameCardOdd_Previews: PreviewProvider {
    static var previews: some View {
        NextGameCardOdd(location: "A", matchDate: "MAY 30", matchTeams: "ORL v CLT")
    }
}
