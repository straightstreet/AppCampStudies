//
//  InterfaceController.swift
//  CaloriesCounter WatchKit Extension
//
//  Created by User on 25.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    var calories = 0
    var caloriesTotal = 0
    var caloriesIncrement = 25
    //var sliderFloat: Float = 0.0
    var sliderHidden: Bool = false
    var sliderValue:Float = 0.0
    var steps:Int = 0
    var maxVal:Float = 1000.0
    var minVal:Float = 0.0
    var increment: Float {
        get {
            return Float(steps)/(maxVal-minVal)
        }
    }

    @IBOutlet weak var caloriesLabel: WKInterfaceLabel!
    @IBOutlet weak var caloriesTotalLabel: WKInterfaceLabel!
    @IBOutlet weak var slider: WKInterfaceSlider!
    @IBOutlet weak var hideButton: WKInterfaceButton!

    @IBAction func plusButtonTapped() {
        calories = calories + caloriesIncrement
        sliderValue = Float(calories)
        if (sliderValue > maxVal) {
            sliderValue = maxVal
        }
        updateScreen()
            }
    
    @IBAction func minusButtonTapped() {
        calories = calories - caloriesIncrement
        sliderValue = Float(calories)
        if (sliderValue < minVal) {
            sliderValue = minVal
        }
        if(calories < 0){
            calories = 0
        }
        updateScreen()
    }

    @IBAction func addButtonTapped() {
        caloriesTotal = caloriesTotal + calories
        caloriesTotalLabel.setText("Calories total: \(caloriesTotal)")
        calories = 0
        updateScreen()
    }

    @IBAction func sliderTapped(value: Float) {
        sliderValue = value
        slider.setValue(sliderValue)
        calories = Int(sliderValue)
        caloriesLabel.setText("\(Int(calories))")
    }

    @IBAction func hideButtonTapped() {
        //hideButton.setHidden(true)
        if(sliderHidden == false){
            slider.setHidden(true)
            sliderHidden = true
        }else{
            slider.setHidden(false)
            sliderHidden = false
        }
    }

    func updateScreen(){
        caloriesLabel.setText("\(calories)")
        slider.setValue(sliderValue)
    }

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

}
