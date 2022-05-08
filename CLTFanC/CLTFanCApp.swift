//  CLTFanCApp.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/14/22.

import SwiftUI
import Firebase

@main
struct CLTFanCApp: App {
    @StateObject var gamesViewModel: GamesViewModel = GamesViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gamesViewModel)
        }
    }
}
