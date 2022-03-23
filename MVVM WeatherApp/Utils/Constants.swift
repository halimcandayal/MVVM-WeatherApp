//
//  Constants.swift
//  MVVM WeatherApp
//
//  Created by Halimcan Dayal on 23.03.2022.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            
           let userDefaults = UserDefaults.standard
           let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=27fdc0f86811d2f7761411bf49573161&units=\(unit)")!
        }
        
    }
    
}
