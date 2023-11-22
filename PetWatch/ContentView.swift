//
//  ContentView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/22/23.
//

import SwiftUI
import SwiftData
import MapKit

struct ContentView: View {

    var body: some View {
        TabView {
            PetListView()
                .tabItem { Label("Pets", systemImage: "dog") }
            PetImagesView()
                .tabItem { Label("Photos", systemImage: "photo")}
        }
    }
}

struct PetListView: View {
    @Environment(\.modelContext) private var modelContext
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
                        Label("Add Items", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a pet")
        }
        .sheet(isPresented: $showNewPetSheet, content: {
            NewPetView(showNewPetSheet: showNewPetSheet)
        })
        .navigationBarBackButtonHidden(true)
    }
    
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

struct TodayView: View {
    var body: some View {
        VStack {
            Text("Pet Test")
            HStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 40, height: 60)
                    
            }
        }
    }
}

#Preview("Content View") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}
#Preview("Today View") {
    TodayView()
}
