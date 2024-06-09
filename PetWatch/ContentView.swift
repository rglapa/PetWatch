//
//  ContentView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var showSheet = false
    @State private var pet = Pet()
    @State private var showCreate = false
    @Query private var items: [Item]
    @Query private var pets: [Pet]
    var body: some View {
        /*Button("Show Sheet") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
            NewPetView()
        })*/
        NavigationStack {
            List {
                ForEach(pets) { pet in
                    HStack {
                        Text(pet.firstName)
                        Text(pet.lastName)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                modelContext.delete(pet)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .symbolVariant(.fill)
                        }
                    }
                }
            }
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            showCreate.toggle()
                        }, label: {
                            Label("Add Item", systemImage: "plus")
                        })
                    }
                }
                .sheet(isPresented: $showCreate, content: {
                    NavigationStack {
                        NewPetView()
                    }
                })
        }
        /*NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }*/
    }

    private func addItem() {
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
    }
}

#Preview {
    ContentView()
}
