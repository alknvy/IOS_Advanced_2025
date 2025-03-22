//
//  HeroService.swift
//  HeroApp
//
//  Created by Yersultan Alkenov on 22.03.2025.
//

import Foundation

final class HeroService {
    private let url = URL(string: "https://akabab.github.io/superhero-api/api/all.json")!

    func fetchHeroes(completion: @escaping (Result<[Hero], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1)))
                return
            }
            
            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(heroes))
                }
            } catch {
                completion(.failure(error))
                print("Error:", error)
            }
        }.resume()
    }
}
