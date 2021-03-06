//
//  CurrentWeather.swift
//  WeatherUpdates
//
//  Created by Prasanth Ramineni on 2/3/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherData(completed: @escaping (Bool) -> ()) {
        let currentWeatherUrl = URL(string: WEATHER_URL)!
        
        
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            let result = response.result
            
            if let dataDictionary = result.value as? Dictionary<String, AnyObject> {
                
                /* Get City Name from Result */
                if let name = dataDictionary["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                /* Get Weather Type from Array of Dictionaries */
                if let weather = dataDictionary["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dataDictionary["main"] as? Dictionary<String, AnyObject> {
                    if let temperatureInKelvin = main["temp"] as? Double {
                        
                        let tempInFarenheight = (temperatureInKelvin * (9/5) - 459.67)
                        
                        self._currentTemp = Double(round(10 * tempInFarenheight/10))
                        print(self.currentTemp)
                    }
                }
            }
            completed(true)
        }
    }
}
