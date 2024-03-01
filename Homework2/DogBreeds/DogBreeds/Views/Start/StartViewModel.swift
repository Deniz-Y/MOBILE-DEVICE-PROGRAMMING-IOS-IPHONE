//
//  StartViewModel.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import Foundation
// StartViewModel
class StartViewModel: ObservableObject {

    @Published var buttonTitle = "START"
    @Published var isButtonTapped = false

    func buttonAction() {
        // print("Start button tapped")
        isButtonTapped = true
    }
}
