//
//  ContentView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/22/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Query private var petList: [Pet]
    @State var showNewPetSheet: Bool = false

    var body: some View {
        NavigationSplitView {
            List {
                Section {
                    ForEach(petList) { pet in
                        NavigationLink(destination: PetDetailView(pet: pet)) {
                            Text("\(pet.firstName)")
                        }
                    }
                    .onDelete(perform: deletePets)
                    /*ForEach(items) { item in
                        NavigationLink {
                            Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                            
                        } label: {
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                        }
                    }
                    .onDelete(perform: deleteItems)
                     */
                } header: {
                    Text("Your Pets")
                        .font(.system(size: 40))
                }
                
            }
            .headerProminence(.increased)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addPetView) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .sheet(isPresented: $showNewPetSheet, content: {
            NewPetView(showNewPetSheet: showNewPetSheet)
        })
        .navigationBarBackButtonHidden(true)
    }

    /*private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }*/
    private func addPetView() {
        withAnimation {
            showNewPetSheet.toggle()
        }
    }
    
    private func deletePets(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(petList[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}
