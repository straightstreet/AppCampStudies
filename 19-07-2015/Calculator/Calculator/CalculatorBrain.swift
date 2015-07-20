//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by User on 19.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    var operation: String = "="
    var operand1: Double = 0
    var operand2: Double = 0

    func calculate() -> Double{
        switch operation {
        case "+": return operand2 + operand1
        case "-": return operand1 - operand2
        case "/": return operand2 == 0 ? 0 : operand1 / operand2
        case "*": return operand1 * operand2
        default: return  0
            
        }

    
    }
    
    func contains(text: String? ,find: String) -> Bool{
        return text!.rangeOfString(find) != nil
    }
    

}