//
//  PetDetailView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/25/23.
//

import SwiftUI

struct PetDetailView: View {
    var pet : Pet
    var body: some View {
        Details(pet: pet)
    }
}

struct Details: View {
    @State var pet: Pet
    var body: some View {
        NavigationSplitView {
            List {
                Section {
                    HStack {
                        Spacer()
                        PetImageView(pet: pet)
                            .clipShape(Circle())
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                Section {
                    HStack {
                        Spacer()
                        Text("\(pet.firstName) \(pet.lastName)")
                        Spacer()
                    }
                } header: {
                    Text("Pet Name")
                }
                Section {
                    HStack {
                        Spacer()
                        Text("\(pet.breed)")
                        Spacer()
                    }
                } header: {
                    Text("Breed")
                }
                
                Section {
                    HStack {
                        Spacer()
                        Text("\(pet.petAge)")
                        Spacer()
                    }
                } header: {
                    Text("Age")
                }
                Section {
                    HStack {
                        Spacer()
                        Text("\(pet.petWeight)")
                        Spacer()
                    }
                } header: {
                    Text("Weight")
                }
                Section {
                    VStack {
                        TextField("Your Notes",text: $pet.petNotes)
                        Spacer()
                    }
                    .frame(height: 120)
                } header: {
                    Text("Notes")
                }
            }
        } detail: {
            Text("Information")
        }
    }
}

#Preview("Pet View") {
    PetDetailView(pet: Pet(firstName: "Artemis", lastName: "Glapa", breed: "Poodle", petAge: "5", petWeight: "70", petNotes: "", image: Data()))
}
