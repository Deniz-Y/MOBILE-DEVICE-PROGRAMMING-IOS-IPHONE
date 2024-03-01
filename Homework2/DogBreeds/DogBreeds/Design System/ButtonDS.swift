//
//  ButtonDs.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import SwiftUI

struct ButtonDS: View {

    private let buttonTitle: String
    private let action: () -> Void

    init(
        buttonTitle: String,
        action: @escaping () -> Void
    ) {
        self.buttonTitle = buttonTitle
        self.action = action
    }

    var body: some View {
        Button(
            action: action
        ) {
            Text(buttonTitle)
                .foregroundColor(Color("buttonText"))
                .padding(.horizontal, Spacing.spacing_5)
                .padding(.vertical, Spacing.spacing_1)
                .background(
                            RoundedRectangle(cornerRadius: Radius.radius_4)
                                .fill(Color("buttonBackground"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: Radius.radius_4)
                                        .stroke(Color("buttonBorder"), lineWidth: 2)
                                )
                        )
        }
        .padding(.vertical, Spacing.spacing_2)
    }
}

struct ButtonDS_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDS(buttonTitle: "test") {}
    }
}
