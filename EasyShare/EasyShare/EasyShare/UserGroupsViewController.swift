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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createGroupBtnAction(_ sender: Any) {
        
        //createGroupBtn.isEnabled = false
        
        performSegue(withIdentifier: "ShowGroupSegue", sender: nil)
        
    }
    
    @IBAction func signOutUserAction(_ sender: UIBarButtonItem) {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let error as NSError {
            print("Sign Out Error: \(error)")
        }
        
        //_ = navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }

}
