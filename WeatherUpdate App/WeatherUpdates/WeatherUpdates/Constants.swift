//
//  Constants.swift
//  WeatherUpdates
//
//  Created by Prasanth Ramineni on 2/3/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="


let OPEN_WEATHER_API_KEY = "43821c9ecbe93c05498e00bde8def470"

let WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(OPEN_WEATHER_API_KEY)"
