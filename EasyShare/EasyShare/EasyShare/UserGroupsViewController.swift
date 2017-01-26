//
//  UserGroupsViewController.swift
//  EasyShare
//
//  Created by Prasanth Ramineni on 1/20/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import FirebaseAuth

class UserGroupsViewController: UIViewController {
    
    @IBOutlet weak var createGroupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createGroupBtnAction(_ sender: Any) {
        
        performSegue(withIdentifier: "ShowGroupSegue", sender: nil)
        
    }
    
    @IBAction func signOutUserAction(_ sender: UIBarButtonItem) {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let error as NSError {
            print("Sign Out Error: \(error)")
        }
        
        dismiss(animated: true, completion: nil)
    }

}
