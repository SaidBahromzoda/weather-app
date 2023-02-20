//
//  ViewController.swift
//  February15
//
//  Created by Daniyal Ganiuly on 15.02.2023.
//

import UIKit
import CoreLocation
import Alamofire

// add delegate
class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherConditionImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    public let WEATHER_URL: String = "https://api.openweathermap.org/data/2.5/weather"
    public let API_KEY: String = "8b9f776f695b68ae7da0bef7865b0554"
    
    public var tempreture: Double = 0
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location =  locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            print("Location: \(location)")
            let params: [String: Any] = ["lat": location.coordinate.latitude,
                                         "lon": location.coordinate.longitude,
                                         "appid": API_KEY,
                                         "units": "metric"]
            getWeatherData(url: WEATHER_URL, params: params)
        }
    }
    
    func getWeatherData(url: String, params: [String: Any]) {
        AF.request(url, method: .get, parameters: params).responseJSON { (response) in
            
        }
    }

    

}

