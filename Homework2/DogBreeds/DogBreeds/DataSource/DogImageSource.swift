//
//  DogImageDataSource.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import Foundation
struct DogImageSource {

    private let baseURL = "https://dog.ceo/api"
    var delegate: DogImageSourceDelegate?

    func fetchRandomImage(breed: String) {

        let session = URLSession.shared
        guard let url = URL(string: "\(baseURL)/breed/\(breed)/images/random") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dataTask = session.dataTask(with: request) { data, _, error in
            guard let data else { return }
            // print(String(decoding: data, as: UTF8.self))
            let decoder = JSONDecoder()
            do {
                let imageData = try decoder.decode(ImageResponse.self, from: data)
                DispatchQueue.main.async {
                    delegate?.randomImageLoaded(imageURL: URL(string: imageData.message))
                    print(imageData.message)
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
