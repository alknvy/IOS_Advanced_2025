//
//  ImageGalleryView.swift
//  PinterestGallery
//
//  Created by Yersultan Alkenov on 04.04.2025.
//

import SwiftUI

struct ImageGalleryView: View {
    @StateObject private var viewModel = ImageGalleryViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.images) { image in
                            AsyncImage(url: URL(string: image.url)) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 150)
                                        .clipped()
                                        .cornerRadius(8)
                                case .failure:
                                    Color.gray
                                        .frame(height: 150)
                                        .cornerRadius(8)
                                case .empty:
                                    ProgressView()
                                        .frame(height: 150)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                    .padding()
                }
                Button("Load More Images") {
                    viewModel.fetchImages()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .navigationTitle("Pinterest Gallery")
        }
    }
}
