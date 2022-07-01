//
//  ViewController.swift
//  WeatherAnimation_App
//
//  Created by Felix Titov on 7/1/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var hummidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let icon = IconWeatherManager.Rain.image
        let weather = CurrentWeather(temperature: 10.0, apparentTemperature: 5.0, hummidity: 30, pressure: 250, image: icon)
        updateUI(with: weather)
        
//        let urlString = "https://api.forecast.io/forecast/2a6d8e376a69c1ae07d4a52dd0c2dfdc/37.8267,-122.423"
//        let baseURL = URL(string: "https://api.forecast.io/forecast/2a6d8e376a69c1ae07d4a52dd0c2dfdc/")
//        let fullURL = URL(string: "37.8267,-122.423", relativeTo: baseURL)
//        
//        let sessionconfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionconfiguration)
//        
//        let request = URLRequest(url: fullURL!)
//        let dataTask = session.dataTask(with: fullURL!) { (data, response, error) in
//            
//        }
//        dataTask.resume()
    }
    
    private func updateUI(with currentWeather: CurrentWeather) {
        imageView.image = currentWeather.image
        pressureLabel.text = currentWeather.pressureString
        hummidityLabel.text = currentWeather.hummidityString
        temperatureLabel.text = currentWeather.temperatureString
        appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
        
        
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
    }
}

