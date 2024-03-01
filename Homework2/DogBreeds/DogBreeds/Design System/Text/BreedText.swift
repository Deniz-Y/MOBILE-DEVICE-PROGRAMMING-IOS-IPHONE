//
//  BreedText.swift
//  DogBreeds
//
//  Created by Lab on 21.11.2023.
//

import SwiftUI

struct BreedText: View {
    private let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .foregroundColor(Color.white)
            .font(.system(size: 18, weight: .semibold, design: .default))
            .padding(10)
            .frame(minWidth: 100, idealWidth: 150, maxWidth: .infinity, minHeight: 40, idealHeight: 40, maxHeight: 40)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
            .padding([.leading, .trailing], 8)
    }
}

struct BreedText_Previews: PreviewProvider {
    static var previews: some View {
        BreedText(text: "Test")
    }
}
