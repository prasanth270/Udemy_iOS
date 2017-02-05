//
//  Location.swift
//  WeatherUpdates
//
//  Singleton Class
//
//  Created by Prasanth Ramineni on 2/4/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
