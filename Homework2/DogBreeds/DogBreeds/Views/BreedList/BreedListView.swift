//
//  BreedListView.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import SwiftUI

struct BreedListView: View {

    @StateObject private var viewModel = BreedListViewModel()
    @State private var selectedBreed: String?

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                LoadingView()
                    .onAppear {
                        viewModel.loadDogList()
                    }
            } else {

                List(viewModel.dogList, id: \.self) { dog in
                    HStack(spacing: .zero) {
                        BreedText(text: dog.breedName)
                            .onTapGesture {
                                viewModel.breedTapped(breed: dog.breedName)
                            }
                    }
                }
                .sheet(isPresented: $viewModel.dogImageViewPresented) {
                    if let selectedBreed = viewModel.selectedBreed {
                        DogImageView(breed: selectedBreed)
                    }
                }
                .navigationBarTitle("Breed List")
            }
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView()
    }
}
