//
//  MainTableViewCell.swift
//  PartyRockApp
//
//  Created by Prasanth Ramineni on 1/8/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    /* UI Image View element */
    @IBOutlet weak var videoImagePreview: UIImageView!
    
    /* UI Label View Element */
    @IBOutlet weak var videoImageTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /* Update ImageView and Video Title Label */
    func updateUI(partyRockModel: PartyRockModel) {
        /* Set Video Title */
        videoImageTitle.text = partyRockModel.videoTitle
        
        /* Convert String to URL - Or have it Sent as an URL */
        let url = URL(string: partyRockModel.imageURL)!
        
        /* Asynchronous Call to download Image Data*/
        DispatchQueue.global().async {
            do {
                let imageData = try Data(contentsOf: url)
                /* Once Image Data is downloaded, set it to UI using Synchronous Thread */
                DispatchQueue.global().sync {
                    /* Set UI Image */
                    self.videoImagePreview.image = UIImage(data: imageData)
                }
            } catch {
                print(" Load Image Failed!! ")
            }
        }
    }
}
