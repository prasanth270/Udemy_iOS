//
//  ViewController.swift
//  EasyShare
//
//  Created by Prasanth Ramineni on 1/13/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class ShowGroupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let topItem = self.navigationController?.navigationBar.topItem {
//            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
//            //topItem.leftBarButtonItem = topItem.backBarButtonItem
//        }
    }

    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    

}

