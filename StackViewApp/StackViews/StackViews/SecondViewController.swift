//
//  SecondViewController.swift
//  StackViews
//
//  Created by Prasanth Ramineni on 1/2/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /* Action - Go Back Button Pressed Function */
    @IBAction func goBackBtnPressed(_ sender: Any) {
        /* Will Dismiss the present View and Go Back.
        Else, If we use Segue to Go Back to previous Screen, This will Create a Stack for Views which can be seen in the Debug Stack View Icon during Run Time */
        dismiss(animated: true, completion: nil)
    }
    
    /* Action - Next Screen Button Pressed Function */
    @IBAction func nextScreenBtnPressed(_ sender: Any) {
        let dataString = "This is from Second Sceeen"
        /* Perform Segue to Third Screen With Segue Identifier and send data in 'dataString' */
        performSegue(withIdentifier: "ThirdVCSegue", sender: dataString)
    }
    
    /* Prepare for Segue to Next Screen */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Set Segue Destination as 'ThirdViewController'
        if let destination = segue.destination as? ThirdViewController {
            // Get Data from Sender object which we set to 'dataString' in 'performSegue' func
            if let data = sender as? String {
                destination.valFromPrevScreen = data // Set Data to Setter
            }
        }
    }
    
}
