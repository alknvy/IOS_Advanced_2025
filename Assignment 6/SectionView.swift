//
//  SectionView.swift
//  Weather
//
//  Created by Yersultan Alkenov on 11.04.2025.
//

import SwiftUI

struct SectionView<Content: View>: View {
    let title: String
    let state: WeatherViewModel.LoadState
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title).font(.headline)
                Spacer()
                switch state {
                case .loading:
                    ProgressView()
                case .failure:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                default:
                    EmptyView()
                }
            }
            if case .success = state {
                content()  
            }
        }
        .padding()
    }
}
