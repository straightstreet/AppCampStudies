//
//  SecondViewController.swift
//  ToDoList3
//
//  Created by User on 19.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items = [Item]()
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "CellID")
        let item = items[indexPath.row]
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = item.details

        cell.textLabel!.textColor = UIColor.whiteColor()
        var selectedBgColorView = UIView()
        let myColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
        selectedBgColorView.backgroundColor = myColor
        cell.selectedBackgroundView = selectedBgColorView
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            //deleteItem(items.removeAtIndex(indexPath.row))
            //itemsMgr.items.removeAtIndex(indexPath.row)
            //itemsMgr.deleteItem(items[indexPath.row])
            deleteItem(items[indexPath.row])
            fetchData()
            //itemsTableView.reloadData()
        }
    }

    func fetchData() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: "Item")
        var error: NSError?
        let fetchResults = manageContext.executeFetchRequest(fetchRequest, error: &error) as? [Item]
        if let results = fetchResults{
            items = results
        }else{
            println("Could not fetch \(error), \(error?.userInfo)")
        }
        itemsTableView.reloadData()
    }

    func deleteItem(item: NSManagedObject){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext!
        manageContext.deleteObject(item)
        var error: NSError?
        if !manageContext.save(&error){
            println("Could not save! \(error) \(error?.userInfo)")
        }
    }

}