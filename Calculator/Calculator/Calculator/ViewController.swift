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
    
    /* Audio Player Button */
    var btnSound: AVAudioPlayer!
    
    /* The Current button pressed */
    var runningNumber = ""

    /* UI Counter Field label */
    @IBOutlet weak var counterLabel: UILabel!
    
    /* Calculator Operations */
    enum Operations: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    /* Current Operation Value */
    var currentOperation = Operations.Empty
    
    /* Left Value + Right Value = Result */
    var leftValueStr = ""
    var rightValueStr = ""
    var result = ""
    
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
        
        /* Initialize Counter to 0 */
        counterLabel.text = "0"
    }

    /* UI Number Buttons Action Function */
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        runningNumber += "\(sender.tag)" //Append the Numbers pressed before operator
        counterLabel.text = runningNumber
    }
    
    /* ---- Operator Pressed Actions ---- */
    @IBAction func onDividePressed(sender: UIButton) {
        processOperations(operation: .Divide)
    }

    @IBAction func onMultiplyPressed(sender: UIButton) {
        processOperations(operation: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: UIButton) {
        processOperations(operation: .Subtract)
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        processOperations(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender: UIButton) {
        processOperations(operation: currentOperation)
    }
    
    /* ---- Operator Pressed Actions ---- */
    
    /* Reset All Values & Operations */
    @IBAction func clearBtnPresses(sender: UIButton) {
        playSound()
        
        counterLabel.text = "0"
        runningNumber = ""
        
        leftValueStr = ""
        rightValueStr = ""
        result = ""
        
        currentOperation = Operations.Empty
        
    }
    
    /* Play Sound Function */
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    /* Process Operations Function */
    func processOperations(operation: Operations) {
        playSound()
        if currentOperation != Operations.Empty {
            /* If running Number is not empty, i.e., User Pressed a Number */
            if runningNumber != "" {
                rightValueStr = runningNumber
                runningNumber = ""
                if currentOperation == Operations.Multiply {
                    result = "\(Double(leftValueStr)! * Double(rightValueStr)!)"
                } else if currentOperation == Operations.Divide {
                    result = "\(Double(leftValueStr)! / Double(rightValueStr)!)"
                } else if currentOperation == Operations.Subtract {
                    result = "\(Double(leftValueStr)! - Double(rightValueStr)!)"
                } else if currentOperation == Operations.Add {
                    result = "\(Double(leftValueStr)! + Double(rightValueStr)!)"
                }
                leftValueStr = result
                counterLabel.text = result
            }
            currentOperation = operation // Handle Multiple Operators used before = pressed
        } else {
            leftValueStr = runningNumber //First time an operator is pressed, assign number as Left Value
            runningNumber = "" // Clear Running number
            currentOperation = operation // Set the Operation and get next running number when operator is pressed
        }
    }
}

