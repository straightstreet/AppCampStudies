//
//  InterfaceController.swift
//  RockPaperScissors WatchKit Extension
//
//  Created by appcamp on 26/07/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var scoreLabel: WKInterfaceLabel!
    @IBOutlet weak var oponentSymbol: WKInterfaceImage!
    @IBOutlet weak var resultLabel: WKInterfaceLabel!

    let defaults = NSUserDefaults(suiteName: "group.com.User.UniqueIdentifier.RockPaperScissors")!
    var score = 0
    var gamesCounter = 0
    var highScore = 0
    let symbols = ["rock", "paper", "scissors"]
    
    @IBAction func chooseRock() {
        play("paper")
    }
    
    @IBAction func choosePaper() {
        play("paper")
    }
    
    @IBAction func chooseScissors() {
        play("scissors")
    }

    @IBAction func showGameStats() {
        highScore = getHighScoreFromDefaults()
        pushControllerWithName("GameStats", context: ["currentScore": "\(score)", "highScore": "\(highScore)", "gamesPlayed": "\(gamesCounter)"])
    }

    @IBAction func resetGame() {
        oponentSymbol.setImage(nil)
        score = 0
        resultLabel.setText("Tap Icon to start")
        scoreLabel.setText("0")
    }

    func play(symbol:String){
        gamesCounter += 1
        let opponentPick = symbols[Int(arc4random_uniform(3))]
        oponentSymbol.setImage(UIImage(named: opponentPick))
            if opponentPick == symbol {
                resultLabel.setText("Tie, +1")
                score+=1
            }else{
                var won = false
                switch symbol{
                    case "rock":
                        if opponentPick == "scissors"{
                            won = true
                        }
                    case "paper":
                        if opponentPick == "rock"{
                            won = true
                        }
                    case "scissors":
                        if opponentPick == "paper"{
                            won = true
                        }
                    default: resultLabel.setText("Unrecognized Symbol")
                    }
                if won{
                    resultLabel.setText("You won! +5")
                    score+=5
                } else {
                    resultLabel.setText("You lost, -2")
                    score -= 2
                }
            }
            scoreLabel.setText("Score: \(score)")
            updateHighScore()
        }
    
    func getHighScoreFromDefaults() -> Int {
        var highScoreFromDefaults = defaults.objectForKey("highScore") as? Int
        return (highScoreFromDefaults != nil) ? highScoreFromDefaults! : 0
    }

    func updateHighScore(){
        highScore = getHighScoreFromDefaults()
        if (score > highScore){
        defaults.setObject(score, forKey: "highScore")
        defaults.synchronize()
        
        }
    }
    
    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        if (identifier != nil){
            play(identifier!)
        }
    }
    
    override func handleActionWithIdentifier(identifier: String?, forLocalNotification localNotification: UILocalNotification) {
        if (identifier != nil){
            play(identifier!)
        }
    }

    //-------------------------------------------------------------------------------------------------------

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