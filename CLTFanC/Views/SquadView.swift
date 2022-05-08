//
//  SquadView.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/28/22.
//

import SwiftUI

struct SquadView: View {
    var body: some View {
        List {
            ForEach(0..<10) {_ in
                playerCell
            }
            .listStyle(.inset)
            .listRowSeparator(.hidden)
        }
    }
    
    var playerCell: some View {
        HStack {
            Image("jordi_alcivar")
                .resizable()
//                .background(
//                    LinearGradient(colors: [Color("secondary"), Color("primary")], startPoint: .toplead, endPoint: .bottom)
//                )
                .frame(maxWidth: 80, maxHeight: 80)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
//                .offset(x: 16)
                .padding()

            
            VStack (alignment: .leading) {
                HStack (spacing: 2){
                    Text("8")
                        .font(.title2)
                        .foregroundColor(Color("primary"))
                        .fontWeight(.black)
                    
                    Text("Jordi Alcivar")
                        .font(.title2)
                        .foregroundColor(Color("primary"))
                        .fontWeight(.bold)
                }
                
                Text("Ecuador")
                    .foregroundColor(Color("primary"))
                    .font(.subheadline)
             
                Text("04.22.98 (24)")
                    .foregroundColor(Color("primary"))
                    .font(.subheadline)
                
                Text("5'8\" 157lbs")
                    .foregroundColor(Color("primary"))
                    .font(.subheadline)
            }
            
            Spacer()
        }
//        .background(
//            //LinearGradient(colors: [Color("primary"), Color("secondary")], startPoint: .topLeading, endPoint: .bottomTrailing)
//            Color("primary")
//        )
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 100)
        .cornerRadius(15)
        .padding(.horizontal, 0)
    }
}

struct SquadView_Previews: PreviewProvider {
    static var previews: some View {
        SquadView().preferredColorScheme(.dark)
    }
}
