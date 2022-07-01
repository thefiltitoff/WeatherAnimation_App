//
//  ViewController.swift
//  WeatherAnimation_App
//
//  Created by Felix Titov on 7/1/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var hummidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let locationManager = CLLocationManager()
    
    lazy var weathermanager = APIWeatherManager(apiKey: "2a6d8e376a69c1ae07d4a52dd0c2dfdc")
    private let coordenates = Coordinates(latitude: 55.763263176658945, longitude: 37.57317109423536)
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestAlwaysAuthorization()
      locationManager.startUpdatingLocation()
      
      getCurrentWeatherData()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      let userLocation = locations.last! as CLLocation
      
      print("my locayion latitude: \(userLocation.coordinate.latitude), longitude: \(userLocation.coordinate.longitude)")
    }
    
    private func getCurrentWeatherData() {
        weathermanager.fetchCurrentWeatherWith(coordinates: coordenates) { result in
            
            self.toggleActivityIndicator(on: false)
            switch result {
                
            case .Success(let currentWeather):
                self.updateUI(with: currentWeather)
            case .Failure(let error as NSError):
                print(error.localizedDescription)
                self.showAlertController(with: "Something went wrong", and: "\(error.localizedDescription)")
                
            }
        }
    }
    
    private func showAlertController(with message: String, and title: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    private func updateUI(with currentWeather: CurrentWeather) {
        imageView.image = currentWeather.image
        pressureLabel.text = currentWeather.pressureString
        hummidityLabel.text = currentWeather.humidityString
        temperatureLabel.text = currentWeather.temperatureString
        appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
        
        
    }
    
    private func toggleActivityIndicator(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        toggleActivityIndicator(on: true)
        getCurrentWeatherData()
    }
}

