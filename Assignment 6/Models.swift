//
//  Models.swift
//  Weather
//
//  Created by Yersultan Alkenov on 11.04.2025.
//

import Foundation


struct WeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
}

struct Weather: Codable {
    let description: String
}

struct Main: Codable {
    let temp: Double
}


struct ForecastResponse: Codable {
    let list: [Forecast]
}

struct Forecast: Codable {
    let dt_txt: String
    let weather: [Weather]
}

