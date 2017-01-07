//
//  ViewController.swift
//  Calculator
//
//  Created by Prasanth Ramineni on 1/6/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnSound: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Get the Path Of the Audio File */
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        
        /* Convert The Path to URL */
        let soundURL = URL(fileURLWithPath: path!)
        
        /* try to handle throws error */
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    /* UI Number Buttons Action Function */
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
    }

    /* Play Sound Function */
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        } 
        btnSound.play()
    }
}

