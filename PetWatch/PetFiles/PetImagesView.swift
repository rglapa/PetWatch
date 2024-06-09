//
//  PetImagesView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/27/24.
//

import SwiftUI
import PhotosUI
import SwiftData

struct PetImagesView: View {
    @Environment(\.modelContext) private var modelContext;
    @Query private var pets: [Pet]
    var body: some View {
        Text("Test")
        //UIImage(data: petGroup?.petFamily[0].petPhotos[0]?)
        /*VStack {
            if let petImage = pet.petImage, let uiImage = UIImage(data: petImage) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 300)
            }
            PhotosPicker(selection: $selectedItems, matching: .images) {
                Text("Select Photo")
            }
        }
        .task(id:selectedItems) {
            if let data = try? await selectedItems?.loadTransferable(type: Data.self) {
                pet.petImage = data
            }
        }*/
    }
}

#Preview {
    PetImagesView()
}
