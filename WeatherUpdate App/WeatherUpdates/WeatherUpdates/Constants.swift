//
//  Constants.swift
//  WeatherUpdates
//
//  Created by Prasanth Ramineni on 2/3/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let WEATHER = "weather?"
let FORECAST = "forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let COUNT = "&cnt="
let MODE = "&mode="
let JSON = "json"
let APP_ID = "&appid="

typealias DownloadComplete = (Bool) -> ()

let OPEN_WEATHER_API_KEY = "43821c9ecbe93c05498e00bde8def470"

let WEATHER_URL = "\(BASE_URL)\(WEATHER)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(OPEN_WEATHER_API_KEY)"
let FORECAST_URL = "\(BASE_URL)\(FORECAST)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(COUNT)10\(MODE)\(JSON)\(APP_ID)\(OPEN_WEATHER_API_KEY)"
