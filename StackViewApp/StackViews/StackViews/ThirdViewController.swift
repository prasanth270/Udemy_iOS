//
//  ThirdViewController.swift
//  StackViews
//
//  Created by Prasanth Ramineni on 1/2/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    /* Label View UI Element */
    @IBOutlet weak var labelView: UILabel!
    
    private var _valFromPrevScreen: String!
    
    /* Getters and Setters from '_valFromPrevScreen' */
    var valFromPrevScreen: String {
        get {
            return _valFromPrevScreen
        } set {
            _valFromPrevScreen = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set the Value to Label View
        labelView.text = _valFromPrevScreen
     
    }

    /*Go back Button - Should go to Second Screen */
    @IBAction func goBackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
