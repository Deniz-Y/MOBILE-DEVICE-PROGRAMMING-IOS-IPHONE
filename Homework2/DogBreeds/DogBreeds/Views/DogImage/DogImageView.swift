//
//  DogImageView.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import SwiftUI

struct DogImageView: View {

    @StateObject private var viewModel = DogImageViewModel()

    var breed: String

    var body: some View {
        VStack {

            if let imageURL = viewModel.imageURL {

               WebImageDS(imageURL: imageURL)

               ButtonDS(buttonTitle: viewModel.buttonTitle) {
                                    viewModel.fetchRandomImage(for: breed)
                                }
            } else {
                LoadingView()
                    .onAppear {
                        viewModel.fetchRandomImage(for: breed)
                    }
            }
        }
    }
}

struct DogImageView_Previews: PreviewProvider {
    static var previews: some View {
        DogImageView(breed: "Test")
    }
}
