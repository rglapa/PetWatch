//
//  PreviewSamplePet.swift
//  PetWatch
//
//  Created by Ruben Glapa on 6/7/24.
//

import SwiftData

@MainActor
let previewPetContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for:Pet.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Pet>()).isEmpty {
            SamplePet.content.forEach { container.mainContext.insert($0)}
        }
        return container
    } catch {
        fatalError("Failed to create Container")
    }
}()
