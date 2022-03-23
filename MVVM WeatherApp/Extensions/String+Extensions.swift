//
//  String+Extensions.swift
//  MVVM WeatherApp
//
//  Created by Halimcan Dayal on 23.03.2022.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
