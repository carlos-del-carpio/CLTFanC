//
//  LargeGameCard.swift
//  CLTFanC
//
//  Created by Carlos Del Carpio on 4/18/22.
//

import SwiftUI

struct LargeGameCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("CLTBlue"))
                .frame(width: UIScreen.main.bounds.width - 32, height: 200)
            
            HStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(width: 75, height: 200)
                        .clipped()
                    
                    VStack {
                        Text("APR 20")
                            .font(Font.custom("Albertus Nova Bold", size: 17))
                            .fontWeight(.heavy)
                        Text("19:00")
                            .font(Font.custom("Albertus Nova Bold", size: 15))
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                }
                
                VStack {
                    HStack {
                        Rectangle()
                            .padding(.bottom, 0)
//                            .border(.red, width: 2)
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
                        Rectangle()
                            .frame(width: 30)
//                            .border(.orange, width: 2)
                            .overlay(
                                Text("at")
                                    .font(Font.custom("Albertus Nova Bold", size: 25))
                                    .foregroundColor(.white)
                            )
                        
                        Rectangle()
                            .padding(0.2)
                            .padding(.bottom, 0)
//                            .border(.red, width: 2)
                            .overlay(
                                VStack {
                                    Image("greenville-crest")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
//                                        .frame(maxWidth: 60)
                                    
                                    Text("GRE")
                                        .font(Font.custom("Albertus Nova Bold", size: 25))
                                        .foregroundColor(.white)

                                }
                            )
                    }
                    .cornerRadius(30)
                    .foregroundColor(Color("CLTBlue"))
                    
                    Text("Triumph Stadium at Legacy Early College")
                        .font(Font.custom("Albertus Nova Bold", size: 15))
                        .foregroundColor(.white)
//                        .scaledToFit()
                        .lineLimit(2)
                        .minimumScaleFactor(0.01)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
//                        .padding(.horizontal)
//                        .border(.green, width: 2)
                }
//                .border(.green, width: 2)
            }
            .cornerRadius(30)
            .frame(width: UIScreen.main.bounds.width - 32, height: 200)
        }
    }
}

struct LargeGameCard_Previews: PreviewProvider {
    static var previews: some View {
        LargeGameCard()
    }
}
