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
    let apparentTemperature: Double
    let hummidity: Double
    let pressure: Double
    let image: UIImage
    
}

extension CurrentWeather: JSONDecodable {
    init?(json: [String : AnyObject]) {
        guard let temperature = json["temperature"] as? Double,
              let apparentTemperature = json["apparentTemperature"] as? Double,
                let hummidity = json["hummidity"] as? Double,
              let pressure = json["pressure"] as? Double,
              let iconString = json["icon"] as? String else {
            return nil
            
        }
        
        let image = IconWeatherManager(rawValue: iconString).image
        
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.pressure = pressure
        self.hummidity = hummidity
        self.image = image
    }
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
        "\(Int(apparentTemperature))˚C"
    }
}
