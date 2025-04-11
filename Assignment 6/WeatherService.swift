//
//  WeatherService.swift
//  Weather
//
//  Created by Yersultan Alkenov on 11.04.2025.
//

import Foundation


struct WeatherService {
    static let apiKey = "946fce6042f84782bc5232738251004"
    static let baseURL = "https://api.openweathermap.org/data/2.5"


        static func fetchCurrentWeather(city: String) async throws -> CurrentWeather {
        let urlString = "\(baseURL)/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()

      
        let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)

       
        return CurrentWeather(temperature: weatherResponse.main.temp, description: weatherResponse.weather.first?.description ?? "No description")
    }

        static func fetchForecast(city: String) async throws -> [ForecastDay] {
        let urlString = "\(baseURL)/forecast?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()

        
        let forecastResponse = try decoder.decode(ForecastResponse.self, from: data)

        
        return forecastResponse.list.compactMap { forecast in
            ForecastDay(day: forecast.dt_txt, description: forecast.weather.first?.description ?? "No description")
        }
    }
}
