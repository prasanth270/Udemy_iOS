//
//  ItemTableViewCell.swift
//  DreamLister
//
//  Created by Prasanth Ramineni on 1/12/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var details: UILabel!
    
    /* Set Cell Data */
    func configureCell(item: Item){
        
        title.text = item.item_title
        price.text = "$ \(item.item_price)"
        details.text = item.item_details
        thumbnail.image = item.toImage?.image_data as? UIImage
    }
}
