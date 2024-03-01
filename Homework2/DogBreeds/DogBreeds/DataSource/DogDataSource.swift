//
//  DogDataSource.swift
//  DogBreeds
//
//  Created by Lab on 19.11.2023.
//

import Foundation

struct DogDataSource {

    private let baseURL = "https://dog.ceo/api"
    var delegate: DogDataSourceDelegate?

    func loadDogList() {

        let session = URLSession.shared

        guard let url = URL(string: "\(baseURL)/breeds/list") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dataTask = session.dataTask(with: request) { data, _, error in
            guard let data else { return }
            // print(String(decoding: data, as: UTF8.self))
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(DogResponse.self, from: data)
                let breedNames = decodedData.message
                let dogList = breedNames.map { Dog(breedName: $0) }
                DispatchQueue.main.async {
                    delegate?.dogListLoaded(dogList: dogList)
                }
                // print(dogList)
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
