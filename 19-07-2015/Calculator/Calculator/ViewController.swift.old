//
//  ViewController.swift
//  Calculator
//
//  Created by User on 19.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!

    var isUserInTheMiddleOfTypingNumber: Bool = false
    
    var operation: String = "="
    var operand1: Double = 0

    
    
    var displayValue: Double {
        get {
        return (display.text! as NSString).doubleValue
        }
        set{
        display.text = "\(newValue)"
        }
    }
    
    
    @IBAction func pushOperation(sender: UIButton) {
        isUserInTheMiddleOfTypingNumber = false
        operation = sender.currentTitle!
        operand1 = displayValue
        display.text = "0"
    }
    
    
    @IBAction func pushDigit(sender: UIButton) {
        
        
        let digit = sender.currentTitle!
        if isUserInTheMiddleOfTypingNumber{
        display.text = display.text == "0" ? digit : display.text! + digit
        }else{
        display.text = digit
            isUserInTheMiddleOfTypingNumber = true
        }
       
        //display.text = display.text == "0" ? digit : display.text! + digit
        
    }
    @IBAction func pushEquals() {
        
        switch operation {
        case "+": displayValue = displayValue  + operand1
        case "-": displayValue = operand1 - displayValue
        case "/": displayValue = displayValue  == 0 ? 0 : operand1 / displayValue
        case "*": displayValue = operand1 * displayValue
        default: displayValue = 0
            
        }

        operation = "="
        isUserInTheMiddleOfTypingNumber = false
    }
    @IBAction func clear(sender: UIButton) {
        display.text = "0"
    }
}

