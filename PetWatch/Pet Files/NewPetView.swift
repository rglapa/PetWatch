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
        case button
        case background
    }
    
    enum ImageState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }
    
    enum TransferError: Error {
        case importFailed
    }
    
    @Environment(\.modelContext) private var modelContext
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
                    HStack {
                        Spacer()
                        CirclePetImageView(pet: newPet, selectedPhoto: selectedPhoto)
                        Spacer()
                    }
                        /*PhotosPicker(selection: $selectedPhoto,
                                 matching: .images,
                                 photoLibrary: .shared()) {
                        Label("Add Image", systemImage: "photo")
                    }*/
                }
                .listRowBackground(Color.clear)
                Section {
                    TextField("Enter First Name", text: $newPet.firstName)
                        //.focused($focusedField, equals:.firstName)
                    TextField("Enter Last Name", text: $newPet.lastName)
                        //.focused($focusedField, equals: .lastName)
                    TextField("Enter Breed", text: $newPet.breed)
                        //.focused($focusedField, equals: .breed)
                } header: {
                    Text("New Pet")
                        //.padding(.top)
                        //.font(.system(size: 30))
                }.headerProminence(.increased)
                Section {
                    TextField("Enter Age", text: $newPet.petAge)
                        //.focused($focusedField, equals: .petAge)
                    TextField("Enter Weight", text: $newPet.petWeight)
                        //.focused($focusedField, equals: .petWeight)
                }
                
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
            //focusedField = nil
            /*if let focusField = focusedField {
                print(focusField)
            }*/
        }
    }
    private func addNewPet(pet: Pet) {
        modelContext.insert(pet)
        dismiss()
        showNewPetSheet.toggle()
    }
}

#Preview {
    return NewPetView(showNewPetSheet: true).modelContainer(for: Pet.self, inMemory: true)
}
