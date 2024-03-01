//
//  BreedListViewModel.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import Foundation
class BreedListViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var dogList: [Dog] = []
    private var dataSource = DogDataSource()
    @Published var dogImageViewPresented = false
    @Published var selectedBreed: String? // Store the selected breed

    init() {
        dataSource.delegate = self
    }
    func loadDogList() {
        dataSource.loadDogList()
    }

    func breedTapped(breed: String) {
            selectedBreed = breed // Set the selected breed
            dogImageViewPresented = true // Trigger the presentation of DogImageView
        }
}

extension BreedListViewModel: DogDataSourceDelegate {
    func dogListLoaded(dogList: [Dog]) {
        isLoading = false
        self.dogList = dogList
    }
}
