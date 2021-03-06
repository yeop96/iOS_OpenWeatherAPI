//
//  Model.swift
//  OpenWeatherAPI
//
//  Created by yeop on 2022/01/31.
//

import Foundation

// MARK: - CurruentWeather
struct CurrentWeather: Codable {
    let weather: Weathers
    let main: Main
    let wind: Wind
    let id: Int
    let name: String
}


// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}


// MARK: - Weather
typealias Weathers = [Weather]
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

// MARK: - Forecast
struct Forecast: Codable {
    let cod: String
    let message, cnt: Int
    let list: Lists
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let country: String
    let population, timezone, sunrise, sunset: Int
}


// MARK: - List
typealias Lists = [List]
struct List: Codable {
    let dt: Int
    let main: MainClass
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main
        case dtTxt = "dt_txt"
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}
