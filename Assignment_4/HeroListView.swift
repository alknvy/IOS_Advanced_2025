//
//  HeroListView.swift
//  HeroApp
//
//  Created by Yersultan Alkenov on 22.03.2025.
//

import SwiftUI

struct HeroListView: View {
    @StateObject var viewModel = HeroListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage).foregroundColor(.red)
                } else {
                    List(viewModel.heroes) { hero in
                        HStack {
                            AsyncImage(url: URL(string: hero.images?.lg ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text(hero.name).font(.headline)
                                if let power = hero.powerstats?.power {
                                    Text("Power: \(power)").font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("SuperHeroes")
            .onAppear {
                viewModel.fetchHeroes()
            }
        }
    }
}
