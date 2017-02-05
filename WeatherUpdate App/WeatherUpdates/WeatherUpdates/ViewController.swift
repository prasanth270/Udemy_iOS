//
//  ViewController.swift
//  WeatherUpdates
//
//  Created by Prasanth Ramineni on 2/2/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherConditionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherData { success in
            if success {
                print("Hello")
                self.updateUI()
            } else {
                print("Data Load Failed")
            }
            
        }
    }
    
    /* Number of Sections in Table View*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /* Number of rows in Table View*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherConditionLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather._cityName
        
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }

}
