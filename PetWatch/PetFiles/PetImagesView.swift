//
//  PetImagesView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 2/27/24.
//

import SwiftUI
import PhotosUI

struct PetImagesView: View {
    @Environment(\.petFamily) private var petGroup
    @Environment(\.dismiss) private var dismiss
    @State var selectedItems: PhotosPickerItem?
    var body: some View {
        //UIImage(data: petGroup?.petFamily[0].petPhotos[0]?)
        VStack {
            PhotosPicker(selection: $selectedItems, matching: .images) {
                Text("Select Photo")
            }
            petGroup.petFamily[0].petPhoto?
                .resizable()
                .scaledToFit()
            Text(petGroup.petFamily[0].firstName)
        }
        //Image(data: petGroup?.petFamily[0].petPhoto, placeholder: "No Image Saved")
        .task(id: selectedItems) {
            petGroup.petFamily[0].petPhoto = try? await selectedItems?.loadTransferable(type: Image.self)
            //print(petGroup.petFamily.count)
        }
    }
}

#Preview {
    PetImagesView()
}
