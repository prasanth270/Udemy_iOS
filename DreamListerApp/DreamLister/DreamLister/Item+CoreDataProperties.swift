//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by Prasanth Ramineni on 1/12/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var create_date: NSDate?
    @NSManaged public var item_details: String?
    @NSManaged public var item_title: String?
    @NSManaged public var item_price: Double
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}
