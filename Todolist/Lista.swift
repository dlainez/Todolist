//
//  Lista.swift
//  Todolist
//
//  Created by CFPAPP on 22/4/16.
//  Copyright © 2016 CFPAPP. All rights reserved.
//

import UIKit

class Lista: NSObject, NSCoding {
    
    
    var title : String!
    var Flag : Int!
    
    override init() {
        Flag = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let inTitle = aDecoder.decodeObjectForKey("title") as? String {
            title = inTitle
        }
        
        if let inStatus = aDecoder.decodeObjectForKey("status") as? Int {
            Flag = inStatus
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(Flag, forKey: "status")
    }

}
