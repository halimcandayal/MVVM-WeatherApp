//
//  Double+Extensions.swift
//  MVVM WeatherApp
//
//  Created by Halimcan Dayal on 23.03.2022.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°",self)
    }
    
}

