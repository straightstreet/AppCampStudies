//
//  SecondViewController.swift
//  ToDoList3
//
//  Created by User on 19.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        itemsTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemsMgr.items.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "CellID")
        
       cell.textLabel!.text = itemsMgr.items[indexPath.row].name

       cell.textLabel!.textColor = UIColor.whiteColor()
       var selectedBgColorView = UIView()
       let myColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
       selectedBgColorView.backgroundColor = myColor
       cell.selectedBackgroundView = selectedBgColorView

       cell.backgroundColor = UIColor.clearColor()

        return cell
        
    }

}