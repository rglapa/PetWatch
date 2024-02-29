//
//  NewPetView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/26/24.
//

import SwiftUI
import PhotosUI

struct NewPetView: View {
    @Environment(\.petFamily) private var petGroup
    @Environment(\.dismiss) private var dismiss
    @Bindable var pet: Pet
    @FocusState var isFocused: Bool
    @State var selectedItem: PhotosPickerItem?
    var body: some View {
        Form {
            TextField("First Name", text: $pet.firstName)
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
            TextField("Last Name", text:$pet.lastName)
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
            TextField("Breed Type", text:$pet.breed)
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
            PhotosPicker(selection: $selectedItem, label: {
                Text("Choose pet")
            })
            pet.petPhoto?
                .resizable()
                .scaledToFit()
            Button("Done") {
                petGroup.petFamily.append(pet)
                dismiss()
                print("\(petGroup.petFamily.count) Test")
            }
        }
        .task(id: selectedItem) {
            pet.petPhoto = try? await selectedItem?.loadTransferable(type: Image.self)
        }
        .onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    NewPetView(pet: Pet())
}
