//
//  WebImageDS.swift
//  DogBreeds
//
//  Created by Lab on 20.11.2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct WebImageDS: View {
    let imageURL: URL?

    var body: some View {
        if let url = imageURL {
            WebImage(url: url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
        } else {
            ProgressView()
        }
    }
}
struct WebImageDS_Previews: PreviewProvider {
    static var previews: some View {
        WebImageDS(imageURL: URL(string: "https://example.com/image.jpg"))
    }
}
