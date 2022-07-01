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
    let humidity: Double
    let pressure: Double
    let image: UIImage
    
}

extension CurrentWeather: JSONDecodable {
    init?(json: [String : AnyObject]) {
        guard let temperature = json["temperature"] as? Double,
              let apparentTemperature = json["apparentTemperature"] as? Double,
                let hummidity = json["humidity"] as? Double,
              let pressure = json["pressure"] as? Double,
              let iconString = json["icon"] as? String else {
            return nil
            
        }
        
        let image = IconWeatherManager(rawValue: iconString).image
        
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.pressure = pressure
        self.humidity = hummidity
        self.image = image
    }
}

extension CurrentWeather {
  var pressureString: String {
    return "\(Int(pressure * 0.750062)) mm"
  }
  
  var humidityString: String {
    return "\(Int(humidity * 100)) %"
  }
  
  var temperatureString: String {
    return "\(Int(5 / 9 * (temperature - 32)))˚C"
  }
  
  var appearentTemperatureString: String {
    return "Feels like: \(Int(5 / 9 * (apparentTemperature - 32)))˚C"
  }
}

