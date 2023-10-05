//
//  NewPetView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/23/23.
//

import SwiftUI
import PhotosUI
import SwiftData

struct NewPetView: View {
    
    enum FocusedField {
        case firstName
        case lastName
        case breed
        case petAge
        case petWeight
        case petNotes
    }
    
    @Environment(\.modelContext) private var petContainer
    @Environment(\.dismiss) var dismiss
    @State var newPet = Pet()
    @State var showNewPetSheet: Bool
    @State var selectedPhoto: PhotosPickerItem?
    
    
    @FocusState var focusedField: FocusedField?
    
    /*let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()*/
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack { // Horizontal Spacing
                        Spacer()
                        CirclePetImageView(pet: newPet, selectedPhoto: selectedPhoto)
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                Section {
                    TextField("Enter First Name", text: $newPet.firstName)
                        .focused($focusedField, equals:.firstName)
                    TextField("Enter Last Name", text: $newPet.lastName)
                        .focused($focusedField, equals: .lastName)
                    TextField("Enter Breed", text: $newPet.breed)
                        .focused($focusedField, equals: .breed)
                } header: {
                    Text("New Pet")
                        //.padding(.top)
                        //.font(.system(size: 30))
                }.headerProminence(.increased)
                Section {
                    TextField("Enter Age", text: $newPet.petAge)
                        .focused($focusedField, equals: .petAge)
                    TextField("Enter Weight", text: $newPet.petWeight)
                        .focused($focusedField, equals: .petWeight)
                }
                Section {
                    VStack {
                        TextField("Enter Notes", text: $newPet.petNotes)
                            .focused($focusedField, equals: .petNotes)
                        Spacer()
                    }
                }
                .frame(height:180)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add pet", action: {
                        addNewPet(pet: newPet)
                    })
                }
            }
        }
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                newPet.imageData = data
            }
        }
        .onTapGesture {
            focusedField = nil
        }
    }
    private func addNewPet(pet: Pet) {
        petContainer.insert(pet)
        dismiss()
        showNewPetSheet.toggle()
    }
}

#Preview {
    return NewPetView(showNewPetSheet: true).modelContainer(for: Pet.self, inMemory: true)
}
