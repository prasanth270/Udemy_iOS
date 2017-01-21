//
//  UserGroupsViewController.swift
//  EasyShare
//
//  Created by Prasanth Ramineni on 1/20/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class UserGroupsViewController: UIViewController {
    
    @IBOutlet weak var createGroupStackView: UIStackView!
    
    @IBOutlet weak var groupNameTxtBox: UITextField!
    
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
        
        createGroupStackView.isHidden = false
        createGroupBtn.setTitle("Save Group", for: .normal)
        
        //createGroupBtn.isEnabled = false
        
        performSegue(withIdentifier: "ShowGroupSegue", sender: nil)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
