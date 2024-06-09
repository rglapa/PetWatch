//
//  NewPetView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/26/24.
//

import SwiftData
import SwiftUI
import PhotosUI

struct NewPetView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var pet = Pet()
    @FocusState var isFocused: Bool
    
    @State var selectedItem: PhotosPickerItem?
    
    var body: some View {
        List {
            TextField("First Name", text: $pet.firstName)
            TextField("Last Name", text: $pet.lastName)
            Section {
                if let imageData = pet.petImage, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                }
                PhotosPicker(selection: $selectedItem, label: {Label("Pick Photo", systemImage: "photo")})
                if pet.petImage != nil {
                    Button(role: .destructive) {
                        withAnimation {
                            selectedItem = nil
                            pet.petImage = nil
                        }
                    } label: {
                        Label("Remove Image", systemImage: "xmark")
                            .foregroundStyle(.red)
                    }
                }
            }
            
            Button("Create Pet") {
                withAnimation {
                    modelContext.insert(pet)
                }
                dismiss()
            }
        }
        .task(id: selectedItem) {
            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                pet.petImage = data
            }
        }
    }
}

#Preview {
    NewPetView().modelContainer(for: Pet.self, inMemory: true)
}
