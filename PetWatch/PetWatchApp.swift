//
//  PetWatchApp.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/25/24.
//

import SwiftUI
import SwiftData

@main
struct PetWatchApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    @State private var petFamily = PetGroup()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(petFamily)
        }
        .modelContainer(sharedModelContainer)
    }
}
