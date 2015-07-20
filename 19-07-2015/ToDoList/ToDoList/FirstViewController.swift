//
//  FirstViewController.swift
//  ToDoList3
//
//  Created by User on 19.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    
    @IBOutlet weak var detailsTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    return true
    }
    
    @IBAction func addItemButton(sender: UIButton) {
        
        if(nameTextfield.text.isEmpty){
        displayAlert()
            
        }else{
        itemsMgr.addItem(nameTextfield.text, details: detailsTextfield.text)
            
            nameTextfield.text = ""
            detailsTextfield.text = ""
            
            self.tabBarController?.selectedIndex = 0;
        }
        
        
    }
    
    func displayAlert()
    {
        let alert = UIAlertController(title: "Empty name!", message: "You cannot save item wwithout name", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
}


