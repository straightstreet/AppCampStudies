//
//  GameStatsController.swift
//  RockPaperScissors
//
//  Created by appcamp on 26/07/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import Foundation
import WatchKit


class GameStatsController: WKInterfaceController{

    @IBOutlet weak var currentScoreLabel: WKInterfaceLabel!
    @IBOutlet weak var highScoreLabel: WKInterfaceLabel!
    @IBOutlet weak var gamesPlayedLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
       super.awakeWithContext(context)
            if let input = context as? [String:String],
                score = input["currentScore"],
                highScore = input["highScore"],
                gamesPlayed = input["gamesPlayed"]{
                    currentScoreLabel.setText(score)
                    highScoreLabel.setText(highScore)
                    gamesPlayedLabel.setText(gamesPlayed)
        }
    }
    
}
