//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Laurence Wingo on 2/18/18.
//  Copyright © 2018 Laurence Wingo. All rights reserved.
//

import UIKit

//ItemsViewController will call a method on the ItemStore class when the ItemsViewController wants a new Item to be created.  The ItemStore class will oblige, creating the ojbect and adding it to an array of instances of Item.

class ItemsViewController: UITableViewController {
    
    //giving the controller access to the ItemStore using a dependency injection way by not instantiating it here in this class in order to create a sense of abstraction therefore it is only a reference through a variable...
    var itemStore: ItemStore!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell.init(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
}

