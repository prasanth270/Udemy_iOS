//
//  LoginViewController.swift
//  EasyShare
//
//  Created by Prasanth Ramineni on 1/20/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var emailAddressTxtBox: UITextField!
    
    @IBOutlet weak var passwordTxtBox: UITextField!
    
    @IBOutlet weak var loginRegisterSegmentControl: UISegmentedControl!
    
    var selectedSegment: Int = 0
    
    var checkLogin: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginRegisterSegmentAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 { // Login
            loginButton.setTitle("Login", for: .normal)
            self.selectedSegment = 0
        } else if sender.selectedSegmentIndex == 1 { // Register
            loginButton.setTitle("Register", for: .normal)
            self.selectedSegment = 1
        }
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        if !checkLogin {
            performSegue(withIdentifier: "userGroupsSegue", sender: nil)
        } else {
            performLogin()
        }
    }
    
    func performLogin() {
        //var success: Bool = false
        
        /* Returns of any of the condition fails */
        guard let email = emailAddressTxtBox.text, let password = passwordTxtBox.text else {
            print("Guard Condition Failed")
            return
        }
        
        if selectedSegment == 0 {
            // Login
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error != nil {
                    //success = false
                    print("Sign In Error: \(error)")
                    return
                } else {
                    //success = true
                    self.performSegue(withIdentifier: "userGroupsSegue", sender: nil)
                }
            })
        } else if selectedSegment == 1 {
            // Register User
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                if error != nil {
                    //success = false
                    print("Create User Error: \(error)")
                    return
                } else {
                   //success = true
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
