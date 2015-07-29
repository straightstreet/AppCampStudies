//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by appcamp on 26/07/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
        var highscorefromdefaults: Int = 0
        let defaults = NSUserDefaults(suiteName: "group.com.User.UniqueIdentifier.RockPaperScissors")!
        @IBOutlet weak var gamesPlayedLabel: UILabel!

    @IBAction func resetHighScore(sender: AnyObject) {
        var notification = UILocalNotification()
        notification.alertBody = "From iPhone!"
        notification.fireDate = NSDate().dateByAddingTimeInterval(NSTimeInterval(10))
        updateHighScore()
        notification.userInfo = ["highscore" : highscorefromdefaults]
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.category = "gameCategory"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        defaults.setInteger(0, forKey: "highScore")
        updateHighScore()
    }

    func updateHighScore(){
        if let highScore = defaults.objectForKey("highScore") as? Int{
            gamesPlayedLabel.text = "High Score: \(highScore)"
            highscorefromdefaults = highScore
        }else {
            gamesPlayedLabel.text = "No High Score"
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateHighScore()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

