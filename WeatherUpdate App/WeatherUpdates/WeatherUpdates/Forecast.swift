//
//  Forecast.swift
//  WeatherUpdates
//
//  Created by Prasanth Ramineni on 2/4/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    private var _date: String!
    private var _weatherType: String!
    private var _highTemperature: Double!
    private var _lowTemperature: Double!
    
    init() {
        
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                let tempInFarenheight = (min * (9/5) - 459.67)
                self._lowTemperature = Double(round(10 * tempInFarenheight/10))
            }
            
            if let max = temp["max"] as? Double {
                let tempInFarenheight = (max * (9/5) - 459.67)
                self._highTemperature = Double(round(10 * tempInFarenheight/10))
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixDateFormat = Date(timeIntervalSince1970: date)
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .full
            dateformatter.dateFormat = "EEEE"
            dateformatter.timeStyle = .none
            
            self._date = unixDateFormat.dayOfWeek()
            
        }
    }
    
    var date: String {
        if _date == nil {
            self._date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            self._weatherType = ""
        }
        return _weatherType
    }
    
    var highTemprature: Double {
        if _highTemperature == nil {
            self._highTemperature = 0.0
        }
        return _highTemperature
    }
    
    var lowTemperature: Double {
        if _lowTemperature == nil {
            self._lowTemperature = 0.0
        }
        return _lowTemperature
    }

}

extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
