//
//  HeroListViewModel.swift
//  HeroApp
//
//  Created by Yersultan Alkenov on 22.03.2025.
//

import SwiftUI

final class HeroListViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = HeroService()

    func fetchHeroes() {
        isLoading = true
        service.fetchHeroes { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let heroes):
                    self?.heroes = heroes
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
