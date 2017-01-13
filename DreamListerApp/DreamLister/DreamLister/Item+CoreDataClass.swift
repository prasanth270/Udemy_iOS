//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Prasanth Ramineni on 1/12/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    /* Called Everytime an Insert happens to Database */
    public override func awakeFromInsert() {
        
        /* Called Super Class */
        super.awakeFromInsert()
        
        /* Set Date to Current Time & Date */
        self.create_date = NSDate()
    }
}
