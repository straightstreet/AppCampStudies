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
    let brain: CalculatorBrain = CalculatorBrain()
    
    var displayValueDouble: Double {
        get {
            return (display.text! as NSString).doubleValue
        }
        set{
            display.text = "\(newValue)"
        }
    }

    var displayValueInt: Int {
        get {
            return (display.text! as NSString).integerValue
        }
        set{
            display.text = "\(newValue)"
        }
    }

    @IBAction func pushOperation(sender: UIButton) {
            isUserInTheMiddleOfTypingNumber = false
            brain.operation = sender.currentTitle!
            brain.operand1 = displayValueDouble
            display.text = "0"
    }
    
    @IBAction func pushDigit(sender: UIButton) {
            let digit = sender.currentTitle!
        if isUserInTheMiddleOfTypingNumber{
            //if digit != "." || display.text?.rangeOfString(".") == nil{
                display.text = display.text == "0" ? digit : display.text! + digit
            //}
        }else{
            display.text = digit
            isUserInTheMiddleOfTypingNumber = true
        }
       //display.text = display.text == "0" ? digit : display.text! + digit
    }

    @IBAction func pushEquals() {
            brain.operand2 = displayValueDouble
            var result = brain.calculate()
        if(result % 1 == 0){
            displayValueInt = Int(result)
        }else{
            displayValueDouble = result
        }
        isUserInTheMiddleOfTypingNumber = false
        brain.operation = "="
    }

    @IBAction func clear(sender: UIButton) {
            display.text = "0"
    }

    @IBAction func dot(sender: UIButton) {
        if isUserInTheMiddleOfTypingNumber{
            if(display.text!.rangeOfString(".") == nil){
                display.text = display.text! + "."
            }
        }
    }

}

