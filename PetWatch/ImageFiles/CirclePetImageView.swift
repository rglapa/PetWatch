//
//  CirclePetImageView.swift
//  PetWatch
//
//  Created by Ruben Glapa on 9/26/23.
//

import SwiftUI
import PhotosUI

struct PetImageView: View {
    var pet: Pet
    var body: some View {
            if let imageData = pet.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    
            } else if pet.imageData == nil || pet.imageData == Data() {
                ZStack { // Layering up from bottom
                    LinearGradient(colors: [.yellow,.orange], startPoint: .top, endPoint: .bottom)
                        .frame(width: 100, height: 100)
                    LinearGradient(colors: [.blue,.purple], startPoint: .leading, endPoint: .trailing)
                        .mask(
                            Image(systemName:"dog.fill")
                                .foregroundStyle(.white)
                                .font(.system(size:44))
                        )
                        .frame(width:100,height:100)
                }
            }
    }
}

struct CirclePetImageView: View {
    @State var pet: Pet
    @State var selectedPhoto: PhotosPickerItem?
    var body: some View {
        PetImageView(pet: pet)
            .clipShape(Circle())
            .overlay(alignment:.bottomTrailing) {
                PhotosPicker(selection: $selectedPhoto,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Image(systemName: "pencil.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size:30))
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(.borderless)
            }
            .task(id: selectedPhoto) {
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                    pet.imageData = data
                }
            }
    }
}

#Preview {
    CirclePetImageView(pet: Pet())
}
