//
//  ImageGalleryViewModel.swift
//  PinterestGallery
//
//  Created by Yersultan Alkenov on 04.04.2025.
//

import Foundation

class ImageGalleryViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    
    func fetchImages() {
        DispatchQueue.global(qos: .userInitiated).async {
            var newImages: [ImageModel] = []
            let group = DispatchGroup()
            
            for _ in 1...5 {
                group.enter()
                let urlString = "https://picsum.photos/300/300"
                if let url = URL(string: urlString) {
                    URLSession.shared.dataTask(with: url) { _, response, error in
                        defer { group.leave() }
                        if error == nil, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                            newImages.append(ImageModel(url: urlString))
                        }
                    }.resume()
                } else {
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                self.images.append(contentsOf: newImages)
            }
        }
    }
}
