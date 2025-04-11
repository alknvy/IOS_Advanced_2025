//
//  Forecast.swift
//  Weather
//
//  Created by Yersultan Alkenov on 11.04.2025.
//


import Foundation
struct ForecastDay: Identifiable {
    let id = UUID()
    let day: String
    let description: String

    init(day: String, description: String) {
        self.day = day
        self.description = description
    }
}
