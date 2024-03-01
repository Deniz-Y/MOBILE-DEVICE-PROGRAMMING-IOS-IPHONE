//
//  StartView.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import SwiftUI

struct StartView: View {
    @StateObject private var viewModel = StartViewModel()

    var body: some View {
        NavigationStack {

            VStack(spacing: .zero) {

                TitleText(text: "Dog Breeds App") // Title for the screen

                Spacer()

                NavigationLink(destination: BreedListView(), isActive: $viewModel.isButtonTapped) {
                                  // EmptyView()
                                }
                ButtonDS(buttonTitle: viewModel.buttonTitle, action: viewModel.buttonAction)
                Spacer()
            }
           .navigationBarTitle("Start Page")
           .navigationBarHidden(true)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
