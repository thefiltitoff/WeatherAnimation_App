//
//  CurrentWeather.swift
//  WeatherAnimation_App
//
//  Created by Felix Titov on 7/1/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

struct CurrentWeather {
    let temperature: Double
    let appearentTemperature: Double
    let hummidity: Double
    let pressure: Double
    let image: UIImage
    
}

extension CurrentWeather {
    var pressureString: String {
        "\(Int(pressure)) mm"
    }
    
    var hummidityString: String {
        "\(Int(hummidity))%"
    }
    
    var temperatureString: String {
        "\(Int(temperature))˚C"
    }
    
    var appearentTemperatureString: String {
        "\(Int(appearentTemperature))˚C"
    }
}
