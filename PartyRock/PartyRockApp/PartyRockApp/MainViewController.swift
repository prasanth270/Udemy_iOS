//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Prasanth Ramineni on 1/7/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    /* Party Rock Model Array */
    var partyRocks = [PartyRockModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRockModel(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sun Burn")
        
        
        partyRocks.append(p1)
        partyRocks.append(p1)
        partyRocks.append(p1)
        partyRocks.append(p1)
        partyRocks.append(p1)
        partyRocks.append(p1)
        partyRocks.append(p1)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    /* Sets the number of rows in a Table View */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    /* Create ReUsable Cells and set them with data */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* Get a Reusable Cell with Identifier */
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyRockCell", for: indexPath) as? MainTableViewCell {
            
            /* Get the Data to be set at this row */
            let partyRock = partyRocks[indexPath.row]
            
            /* Update UI Cell by setting the Image View, Label */
            cell.updateUI(partyRockModel: partyRock)
            return cell
            
        } else {
            /* Else Return Generic TableViewCell */
            return UITableViewCell()
        }
    }
    
    /* Default Function Which is executed when a User Selects a Row */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRockModel = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVCSegue", sender: partyRockModel)
    }
    
    /* Prepare Data for Segue */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /* get the destination View Controller */
        if let destination = segue.destination as? VideoViewController {
            
            /* Sender Comes from 'performSegue' function and cast it to the Object*/
            if let partyRock = sender as? PartyRockModel {
                
                destination.partyRockModel = partyRock
            }
        }
    }
}

