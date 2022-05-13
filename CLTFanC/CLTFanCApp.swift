//  CLTFanCApp.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/14/22.
import SwiftUI
import Firebase

@main
struct CLTFanCApp: App {
    @StateObject var gamesViewModel: GamesViewModel = GamesViewModel()
    @StateObject var playersViewModel: PlayersViewModel = PlayersViewModel()
    
    init() {
        FirebaseApp.configure()
//        UINavigationBar.appearance().backgroundColor = UIColor(Color("primary"))
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color("secondary"))]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color("secondary"))]
//        UINavigationBar.appearance().tintColor = UIColor(Color("secondary"))self.backgroundColor = backgroundColor
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gamesViewModel)
                .environmentObject(playersViewModel)
        }
    }
}
