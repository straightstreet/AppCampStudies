//
//  Item.swift
//  ToDoList
//
//  Created by User on 25.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    @NSManaged var details: String
    @NSManaged var name: String

}
