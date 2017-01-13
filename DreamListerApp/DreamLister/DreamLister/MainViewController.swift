//
//  ViewController.swift
//  DreamLister
//
//  Created by Prasanth Ramineni on 1/12/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    /* UI Table View */
    @IBOutlet weak var tableView: UITableView!
    /* UI Segment Control */
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /* ---- Default Implementations from TableViewDelegate ---- */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    /* ---- Default Implementations from TableViewDelegate ---- */

}

