//
//  ViewController.swift
//  MiraclePills
//
//  Created by Prasanth Ramineni on 1/1/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    /* Picker View UI Element */
    @IBOutlet weak var statePicker: UIPickerView!
    /* Button View UI Element */
    @IBOutlet weak var statePickerButton: UIButton!
    
    /* List of Few States */
    let states = ["California", "Florida", "Nevada", "Washington", "Texas", "North Carolina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }
    
    /* On Button Pressed Action */
    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
    }

    /* Number of Picker Components */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /* Total Number of Rows in Component */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    /* Value for Each Row */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    /* After Selecting a row from Picker View */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerButton.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
    }
    
}

