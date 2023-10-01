//
//  PetWatchApp.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/22/23.
//

import SwiftUI
import SwiftData

@main
struct PetWatchApp: App {
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Pet.self,
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        
    }
}
