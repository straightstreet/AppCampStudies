//
//  InterfaceController.swift
//  Calculator WatchKit Extension
//
//  Created by User on 25.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    var display = "0"
    var operand1 = "0"
    var operation = "="
    var isUserInTheMiddleOfTyping = false
    let initialDigits = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    let initialOperations = ["+", "-", "*", "/", "="]
    @IBOutlet weak var displayLabel: WKInterfaceLabel!

    @IBAction func pushDigit() {
        presentTextInputControllerWithSuggestions(initialDigits, allowedInputMode: .Plain, completion: { (selectedDigit) -> Void in
            if let digit = selectedDigit?[0] as? String {
            if self.isUserInTheMiddleOfTyping{
                self.display = self.display + digit
            }else{
                self.display = digit
                self.isUserInTheMiddleOfTyping = true
                }
            }
            self.displayLabel.setText(self.display)
        })
    }

    @IBAction func pushOpertion() {
        presentTextInputControllerWithSuggestions(initialOperations, allowedInputMode: .Plain) { (selectedOperation) -> Void in
            if let operation = selectedOperation?[0] as? String{
                switch operation {
                case "+": self.processOperation("+")
                case "-": self.processOperation("-")
                case "*": self.processOperation("*")
                case "/": self.processOperation("/")
                case "=": self.processEquals()
                default: self.display = "0"
                }
                self.isUserInTheMiddleOfTyping = false
            }
        }
    }

    func processOperation(op: String){
        operation = op
        operand1 = display
        displayLabel.setText(op)
    }

    func processEquals(){
        let infoDictionary = ["operand1": operand1, "operand2": display, "operation": operation]
        WKInterfaceController.openParentApplication(infoDictionary) { (replyDictionary, error) -> Void in
            if let castedResponseDictionary = replyDictionary as? [String: Double],
                responseMessage = castedResponseDictionary["result"]{
                    self.displayLabel.setText("\(responseMessage)")
            }
        }
    }
}


/*

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
*/

