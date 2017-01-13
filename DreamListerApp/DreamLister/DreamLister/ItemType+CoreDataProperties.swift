//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by Prasanth Ramineni on 1/12/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var item_type: String?
    @NSManaged public var toItem: Item?

}
