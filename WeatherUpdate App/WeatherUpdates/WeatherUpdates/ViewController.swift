//
//  ViewController.swift
//  WeatherUpdates
//
//  Created by Prasanth Ramineni on 2/2/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherConditionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecastArray = [Forecast]()
    
    let locationManger = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationAuthStatus()
        tableView.delegate = self
        tableView.dataSource = self
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startMonitoringSignificantLocationChanges()
        
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherData { success in
            if success {
                self.updateUI()
                
            } else {
                print("Data Load Failed")
            }
        }
        
        downloadWeatherData { success in
            if success {
                self.tableView.reloadData()
            } else {
                
            }
        }
        
    }
    
    /* Number of Sections in Table View*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /* Number of rows in Table View*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecastArray[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    func updateUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherConditionLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    func downloadWeatherData(completed: @escaping DownloadComplete) {
        let forecastUrl = URL(string: FORECAST_URL)!
        Alamofire.request(forecastUrl).responseJSON { (response) in
            let result = response.result
            
            if let dataDictionary = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dataDictionary["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for object in list {
                        let forecast = Forecast(weatherDict: object)
                        self.forecastArray.append(forecast)
                    }
                    /* Remove First Entry which is today */
                    self.forecastArray.remove(at: 0)
                }
            }
            completed(true)
        }
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManger.location
            
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            print(Location.sharedInstance.latitude, Location.sharedInstance.longitude)
            
        } else {
            locationManger.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }

}

