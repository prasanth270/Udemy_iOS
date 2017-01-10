//
//  VideoViewController.swift
//  PartyRockApp
//
//  Created by Prasanth Ramineni on 1/7/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    /* UI Web View to Show Youtube Video */
    @IBOutlet weak var webView: UIWebView!
    
    /* Object for PartyRockModel class */
    private var _partyRockModel: PartyRockModel!
    
    /* Getter & Setter for _partyRockModel */
    var partyRockModel: PartyRockModel {
        get {
            return _partyRockModel
        } set {
            _partyRockModel = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        /* Set the Video URL to Webview */
        webView.loadHTMLString(partyRockModel.videoURL, baseURL: nil)
    }
    

}
