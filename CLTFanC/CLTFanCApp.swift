//  CLTFanCApp.swift
//  CLTFanC
//  Created by Carlos Del Carpio on 4/14/22.

import SwiftUI
import Firebase

@main
struct CLTFanCApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
