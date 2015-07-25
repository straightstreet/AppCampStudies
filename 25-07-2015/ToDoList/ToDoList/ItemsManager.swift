//
//  ItemsManager.swift
//  ToDoList2
//
//  Created by User on 19.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

//import Foundation
import UIKit
import CoreData

var itemsMgr: ItemsManager = ItemsManager()

struct item {
    var name = ""
    var details = ""

}

class ItemsManager : NSObject {
    
    var items = [item]()
    
    func addItem(name: String, details: String){
        //items.append(item(name: name, details: details)) //zapisywanie obiektu do tablicy

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext!

        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: manageContext)

        let itemM0 = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)

        itemM0.setValue(name, forKey: "name")
        itemM0.setValue(details, forKey: "details")

        var error: NSError?

        if !manageContext.save(&error){
            println("You fucc'd up and dont kno what to do \(error) \(error?.userInfo)")
        }
        

    }
}