//
//  WeatherEntity.swift
//  February15
//
//  Created by Daniyal Ganiuly on 15.02.2023.
//

import Foundation



class WeatherEntity: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    class Main: Decodable {
        let temp: Double
    }
    
    class Weather: Decodable {
        let id: Int
    }
}
