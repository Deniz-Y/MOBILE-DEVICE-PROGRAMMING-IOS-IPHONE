//
//  DogImageSourceDelegate.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import Foundation
protocol DogImageSourceDelegate: AnyObject {
    func randomImageLoaded(imageURL: URL?)
}
