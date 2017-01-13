//
//  ViewController.swift
//  DreamLister
//
//  Created by Prasanth Ramineni on 1/12/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    /* UI Table View */
    @IBOutlet weak var tableView: UITableView!
    /* UI Segment Control */
    @IBOutlet weak var segmentControl: UISegmentedControl!
    /* Fetch Results Controller */
    var controller: NSFetchedResultsController<Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //generateData()
        attemptFetch()
        
    }
    
    /* ---- Default Implementations from TableViewDelegate ---- */
    /* Number of Section in Table View */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = controller.sections {
         
            let sectionInfo = sections[section]
         
            print("Number of Sections: \(sectionInfo.numberOfObjects)")
            return sectionInfo.numberOfObjects
        }
            return 0
    }

    /* Cells at Each Row based on IndexPath */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* Find the Cell with Identifier and Make it Reusable Cell */
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
        return cell
    }
    /* Set number of sections in table view */
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
    /* ---- Default Implementations from TableViewDelegate ---- */
    
    /* Configure Table View Cell */
    func configureCell(cell: ItemTableViewCell, indexPath: NSIndexPath) {
        
        let item = controller.object(at: indexPath as IndexPath)
        
        cell.configureCell(item: item)
    }
    
    /* Fix the Row Height to 150 at each indexpath */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    /* Fetch Data From Database using FRC - Fetch Result Controller */
    func attemptFetch() {
        /* Create a Fetch Request for Item Table*/
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        /* Sort Using 'create_date' column */
        let dateSort = NSSortDescriptor(key: "create_date", ascending: false)
        /* Set Sort Descriptors.  Can be Multiple Sort Descriptors */
        fetchRequest.sortDescriptors = [dateSort]
        
        /* Context is the NSManagedContext set in AppDelegate as context = AppDelegate.persistentContainer.viewContext*/
        controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try self.controller.performFetch() /* Perform Fetch From Database and set Data to FRC */
        } catch {
            let err = error as NSError
            print(err)
        }
    }
    
    /* When Data In controller is Changed, Begin to Update the table View */
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    /* Once data is updated in table view, end the update */
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }
    
    /* Define Action for Each NS Fetch Result Change Type [insert, update, move, delete]*/
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case .update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemTableViewCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    /* Generate Sample Data and save it to application context */
    func generateData() {
        
        let item = Item(context: context)
        item.item_title = "New Macbook Pro"
        item.item_price = 1800
        item.item_details = "New Macbook Pro... It's way Costly Man!!!"
        
        let item2 = Item(context: context)
        item2.item_title = "New Macbook"
        item2.item_price = 100
        item2.item_details = "New Macbook Pro... It's way Costly Man!!!"
        
        let item3 = Item(context: context)
        item3.item_title = "New Pro"
        item3.item_price = 800
        item3.item_details = "New Macbook Pro... It's way Costly Man!!!"
        
        let item4 = Item(context: context)
        item4.item_title = "Macbook Pro"
        item4.item_price = 1200
        item4.item_details = "New Macbook Pro... It's way Costly Man!!!"
        
        appDelegate.saveContext()
    }

}

