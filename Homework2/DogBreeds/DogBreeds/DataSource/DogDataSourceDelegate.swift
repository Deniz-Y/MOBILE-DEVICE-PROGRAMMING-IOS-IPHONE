//
//  DogDataSourceDelegate.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import Foundation

protocol DogDataSourceDelegate: AnyObject {
    func dogListLoaded(dogList: [Dog])
}
