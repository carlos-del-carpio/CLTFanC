//  SquadView.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/28/22.
import SwiftUI

struct SquadView: View {
    @EnvironmentObject var playersViewModel: PlayersViewModel
    
    var body: some View {
        List {
            Section(header: Text("Goalkeepers")) {
                ForEach(playersViewModel.players) { player in
                    if player.primaryPosition == "Goalkeeper" {
                        SquadCell(player: player)
                    }
                }
            }
            .headerProminence(.increased)
            .listStyle(.plain)
            .listRowSeparatorTint(Color("primary"))
            
            Section(header: Text("Defenders")) {
                ForEach(playersViewModel.players) { player in
                    if player.primaryPosition == "Defender" {
                        SquadCell(player: player)
                    }
                }
            }
            .headerProminence(.increased)
            .listStyle(.plain)
            .listRowSeparatorTint(Color("primary"))
            
            Section(header: Text("Midfielders")) {
                ForEach(playersViewModel.players) { player in
                    if player.primaryPosition == "Midfielder" {
                        SquadCell(player: player)
                    }
                }
            }
            .headerProminence(.increased)
            .listStyle(.plain)
            .listRowSeparatorTint(Color("primary"))
            
            Section(header: Text("Forwards")) {
                ForEach(playersViewModel.players) { player in
                    if player.primaryPosition == "Forward" {
                        SquadCell(player: player)
                    }
                }
            }
            .headerProminence(.increased)
            .listStyle(.plain)
            .listRowSeparatorTint(Color("primary"))
        }
    }
}

struct SquadView_Previews: PreviewProvider {
    static let envObject = PlayersViewModel()
    static var previews: some View {
        SquadView()
            .preferredColorScheme(.dark)
            .environmentObject(envObject)
    }
}
