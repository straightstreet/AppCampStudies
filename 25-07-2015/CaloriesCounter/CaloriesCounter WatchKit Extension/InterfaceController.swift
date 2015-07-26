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

    var calories = 500
    var caloriesTotal = 0
    var sliderFloat: Float = 0.0

    @IBOutlet weak var caloriesLabel: WKInterfaceLabel!

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

    @IBAction func plusButtonTapped() {

        calories = calories + 100
        updateScreen()
            }
    @IBAction func minusButtonTapped() {
        calories = calories - 100
        slider.setValue(-100)

        updateScreen()
    }
    @IBAction func addButtonTapped() {
        caloriesTotal = caloriesTotal + calories
        updateScreen()
    }

    func updateScreen(){
        caloriesLabel.setText("\(calories)")
    }

    @IBAction func sliderTapped(value: Float) {
        sliderFloat = value
        caloriesLabel.setText("\(Int(sliderFloat))")
    }

    @IBOutlet weak var slider: WKInterfaceSlider!
    @IBAction func hidden() {
        slider.setHidden(true)

    }
}
