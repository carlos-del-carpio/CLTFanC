//  SquadView.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/28/22.
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
                .frame(maxWidth: 80, maxHeight: 80)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding(.trailing, 10)

            
            VStack (alignment: .leading) {
                HStack (spacing: 2){
                    Text("16")
                        .font(.title2)
                        .foregroundColor(Color("primary"))
                        .fontWeight(.black)
                    
                    Text("Andre Shinyashiki")
                        .font(.title2)
                        .foregroundColor(Color("primary"))
                        .fontWeight(.bold)
                }
                
                Text("Midfielder")
                    .foregroundColor(Color("primary"))
                    .font(.subheadline)
                
                Text("Ecuador")
                    .foregroundColor(Color("primary"))
                    .font(.subheadline)
            }
            
            Spacer()
        }
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
