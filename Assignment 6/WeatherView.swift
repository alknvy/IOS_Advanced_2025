//
//  WeatherView.swift
//  Weather
//
//  Created by Yersultan Alkenov on 11.04.2025.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()

    @State private var city: String = "London"
    var body: some View {
        NavigationView {
            VStack {
                TextField("Введите город", text: $city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Получить погоду") {
                    Task {
                        await viewModel.fetchWeatherData(for: city)
                    }
                }
                .padding()

                List {
                    SectionView(title: "Текущая погода", state: viewModel.currentState) {
                        if let currentWeather = viewModel.currentWeather {
                            Text("Температура: \(currentWeather.temperature)°C")
                            Text("Состояние: \(currentWeather.description)")
                        } else {
                            EmptyView()
                        }
                    }

                    SectionView(title: "Прогноз на 5 дней", state: viewModel.forecastState) {
                        if !viewModel.forecast.isEmpty {
                            ForEach(viewModel.forecast) { day in
                                Text("\(day.day): \(day.description)")
                            }
                        } else {
                            EmptyView()
                        }
                    }
                }
                .navigationTitle("Погода")
            }
            .onAppear {
                Task {
                    await viewModel.fetchWeatherData(for: city)                }
            }
        }
    }
}

