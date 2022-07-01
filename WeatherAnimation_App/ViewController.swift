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
        let weather = CurrentWeather(temperature: 10.0, appearentTemperature: 5.0, hummidity: 30, pressure: 250, image: icon)
        updateUI(with: weather)
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

