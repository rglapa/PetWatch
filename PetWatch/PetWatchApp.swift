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
            Pet.self,
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
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        
    }
}
extension EnvironmentValues {
    var petFamily: PetGroup {
        get { self[PetGroupKey.self]}
        set { self[PetGroupKey.self] = newValue }
    }
}

private struct PetGroupKey: EnvironmentKey {
    static var defaultValue: PetGroup = PetGroup()
}
