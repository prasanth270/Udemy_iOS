//
//  WeatherCell.swift
//  WeatherUpdates
//
//  Created by Prasanth Ramineni on 2/4/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast){
        lowTemp.text = "\(forecast.lowTemperature)"
        highTemp.text = "\(forecast.highTemprature)"
        weatherType.text = forecast.weatherType
        weatherImage.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
    }

}
