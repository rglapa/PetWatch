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
    @Environment(\.modelContext) private var modelContext
    @State var petFirstName: String = ""
    @State var petLastName: String = ""
    @State var petBreed: String = ""
    @State var petAge: Int?
    @State var petWeight: Int?
    @State var newPet = Pet(firstName: "", lastName: "", breed: "")
    @State var showNewPetSheet: Bool
    var body: some View {
        Form {
            Section {
                TextField("Enter First Name", text: $newPet.firstName)
                TextField("Enter Last Name", text: $newPet.lastName)
                TextField("Enter Breed", text: $newPet.breed)
            }
            Section {
                TextField("Enter Age", value: $newPet.age, formatter: NumberFormatter())
                TextField("Enter Weight", value: $newPet.weight, formatter: NumberFormatter())
            }
            Section {
                HStack {
                    Spacer()
                    Button("Add Pet", action: {
                        addNewPet()
                    })
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
        }
    }
    private func addNewPet() {
        modelContext.insert(newPet)
        showNewPetSheet.toggle()
    }
}

#Preview {
    return NewPetView(showNewPetSheet: true).modelContainer(for: Pet.self, inMemory: true)
}
