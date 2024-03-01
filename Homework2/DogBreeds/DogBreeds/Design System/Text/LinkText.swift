//
//  LinkText.swift
//  DogBreeds
//
//  Created by Lab on 20.11.2023.
//

import SwiftUI

struct LinkText: View {
    let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .foregroundStyle(Color("linkText"))
    }
}
struct LinkText_Previews: PreviewProvider {
    static var previews: some View {
        LinkText(text: "Test")
    }
}
