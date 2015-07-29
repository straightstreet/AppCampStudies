//
//  GlanceController.swift
//  CaloriesCounter
//
//  Created by appcamp on 26/07/15.
//  Copyright (c) 2015 User. All rights reserved.
//

import WatchKit
import Foundation

class GlanceController: WKInterfaceController {

    @IBOutlet weak var dailyLimitLabel: WKInterfaceLabel!
    @IBOutlet weak var caloriesTotalLabel: WKInterfaceLabel!
    @IBOutlet weak var caloriesLeftlabel: WKInterfaceLabel!
    var caloriesLeftTemp:Int = 2500
    let caloriesForDay = 2500

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        caloriesLeftlabel.setText("\(caloriesForDay)")
        caloriesLeftlabel.setTextColor(UIColor.orangeColor())
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let defaults = NSUserDefaults.standardUserDefaults()
        let calories = defaults.integerForKey("caloriesTotal")
        caloriesLeftTemp = caloriesLeftTemp - calories
        let caloriesLeft = caloriesLeftTemp
        caloriesTotalLabel.setText("Total calories eaten: \(calories)")
        if calories > 0 {
            self.caloriesLeftlabel.setText("\(caloriesLeft)")
            self.caloriesLeftlabel.setTextColor(UIColor.orangeColor())
        }else{
            self.caloriesLeftlabel.setText("\(caloriesForDay)")
            self.caloriesLeftlabel.setTextColor(UIColor.orangeColor())
        }
        if caloriesLeft < 0{
            caloriesLeftlabel.setText("0")
            caloriesLeftlabel.setTextColor(UIColor.orangeColor())
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
