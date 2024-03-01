//
//  DogImageViewModel.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import Foundation

class DogImageViewModel: ObservableObject {

    @Published var imageURL: URL?
    @Published var buttonTitle = "Load Another Image"

    private var dataSource = DogImageSource()

    init() {
        dataSource.delegate = self
    }

    func fetchRandomImage(for breed: String) {
        dataSource.fetchRandomImage(breed: breed)
    }
}

extension DogImageViewModel: DogImageSourceDelegate {
    func randomImageLoaded(imageURL: URL?) {
            self.imageURL = imageURL
    }
}
