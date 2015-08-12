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
        
        self.itemsTableView.backgroundColor = UIColor(red: 86/255, green: 160/255, blue: 255/255, alpha: 1)
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
        let selectedBgColorView = UIView()
        let myColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
        selectedBgColorView.backgroundColor = myColor
        cell.contentView.backgroundColor =  UIColor(red: 86/255, green: 160/255, blue: 255/255, alpha: 1)
        cell.selectedBackgroundView = selectedBgColorView
        
        
        return cell
    }

    //funkcja na usuwanie
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
        let manageContext = appDelegate.managedObjectContext

        do{
        let fetchRequest = NSFetchRequest(entityName: "Item")

        let fetchResults = try manageContext.executeFetchRequest(fetchRequest) as? [Item]
      
        if let results = fetchResults{
            items = results
        }else{
            print("Could not fetch ")
        }
        }
        catch{
            print("FetchError")
        }
        itemsTableView.reloadData()

    }

    func deleteItem(item: NSManagedObject){

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext
        do {
            manageContext.deleteObject(item)
        } catch {
            print("Could not save! ")
        }

    }
}