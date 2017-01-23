//
//  ItemDetailsViewController.swift
//  DreamLister
//
//  Created by Prasanth Ramineni on 1/21/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var stores = [Store]()
    
    var itemToEdit: Item?
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var storePicker: UIPickerView!
    
    @IBOutlet weak var titleField: CustomTextField!
    
    @IBOutlet weak var priceField: CustomTextField!
    
    @IBOutlet weak var detailsField: CustomTextField!
    
    @IBOutlet weak var thumbImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        //createStores()
        retrieveStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
    }

    /* Returns the title for each row */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.store_name
    }
    
    /* Returns number of rows in each component */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }

    /* Returns number of columns to display */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*Update When a Row is Selected */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    /* Retrieve store list and add to stores array */
    func retrieveStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            storePicker.reloadAllComponents()
        } catch {
            
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Item!
        
        let picture = Image(context: context)
        picture.image_data = thumbImage.image
        
        if itemToEdit == nil {
            item = Item(context: context)
        } else {
            item = itemToEdit!
        }
        
        item.toImage = picture
        
        if let title = titleField.text {
            item.item_title = title
        }
        
        if let price = priceField.text {
            item.item_price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            item.item_details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        appDelegate.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            appDelegate.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbImage.image = image
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            titleField.text = item.item_title
            priceField.text = "\(item.item_price)"
            detailsField.text = item.item_details
            
            thumbImage.image = item.toImage?.image_data as? UIImage
            
            if let store = item.toStore {
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.store_name == store.store_name {
                        storePicker.selectRow(index, inComponent: 0, animated: true)
                        break
                    }
                    index += 1
                } while(index < stores.count)
            }
        }
    }
    
    func createStores() {
        let store = Store(context: context)
        let store1 = Store(context: context)
        let store2 = Store(context: context)
        let store3 = Store(context: context)
        let store4 = Store(context: context)
        let store5 = Store(context: context)
        
        store.store_name = "Walmart"
        store1.store_name = "Amazon"
        store2.store_name = "Best Buy"
        store3.store_name = "Fry's Electronics"
        store4.store_name = "Mini Mart"
        store5.store_name = "K Mart"
        appDelegate.saveContext()
    }
}
