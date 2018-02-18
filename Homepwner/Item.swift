//
//  Item.swift
//  Homepwner
//
//  Created by Laurence Wingo on 2/18/18.
//  Copyright © 2018 Laurence Wingo. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    //Here are the properties for the Item class or for each Item instance...
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: NSDate
    
    
    //I'm declaring a custom initializer for the class.  By doing this, I lose out on the free initializer- init() that classes have.  The free initializer is useful when all of your class's properties have default values and you do not need to do additional work to create the new instance.
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = NSDate()
    }
    
    //Every class must have at least one designated initializer, but convenience initializers are optional.  You can think of convenience initializers as helpers.  A convenience initializer always calls another initializer on the same class.  Convenience initializers are indicated by the "convenience" keyword before the initializer name.
    convenience init(random: Bool = false) {
        //above says this is a function that takes a variable that is a boolean to determine the output
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            //two arrays of strings
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            // the above variable idx is, a random generated number with the highest value possible being the number of elements within the array named adjectives.
            
            let randomAdjective = adjectives[Int(idx)]
            //the above variable uses the adjectives array to find the element at the idx value as it is coerced into an Integer from the idx's beginning type of UnsignedInteger32bit
            
            idx = arc4random_uniform(UInt32(nouns.count))
            //the above replaces the idx variable with a new UnsignedInteger32bit value that uses the highest number of elements within the nouns array as the upperbounds.
            let randomNoun = nouns[Int(idx)]
            //the above variable uses the nouns array to find the element at the idx value as it is coerced into an Integer from the idx's beginning type of UnsignedInteger32bit
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = NSUUID.init().uuidString.components(separatedBy: "-").first!
            
            //convenience initializers must call another initializer on the same type, whereas designated initializers must call a designated initializer on its superclass.
            self.init(name: randomName,
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
}

