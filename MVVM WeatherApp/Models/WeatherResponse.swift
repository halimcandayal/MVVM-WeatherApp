//
//  WeatherResponse.swift
//  MVVM WeatherApp
//
//  Created by Halimcan Dayal on 23.03.2022.
//

import Foundation

struct WeatherResponse : Decodable {
    
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    
    let temp: Double
    let humidity: Double
}
