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
    
    //giving the controller access to the ItemStore...
    var itemStore: ItemStore!
}

