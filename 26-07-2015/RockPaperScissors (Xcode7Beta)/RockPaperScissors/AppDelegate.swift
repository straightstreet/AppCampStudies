//
//  AppDelegate.swift
//  RockPaperScissors
//
//  Created by appcamp on 26/07/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        var categories = NSMutableSet()
        
        var playRock = UIMutableUserNotificationAction()
        playRock.title = "playRock"
        playRock.identifier = "rock"
        playRock.activationMode = UIUserNotificationActivationMode.Foreground
        playRock.authenticationRequired = false
        
        var playPaper = UIMutableUserNotificationAction()
        playPaper.title = "playPaper"
        playPaper.identifier = "paper"
        playPaper.activationMode = UIUserNotificationActivationMode.Foreground
        playPaper.authenticationRequired = false

        var playScissors = UIMutableUserNotificationAction()
        playScissors.title = "playScis"
        playScissors.identifier = "scissors"
        playScissors.activationMode = UIUserNotificationActivationMode.Foreground
        playScissors.authenticationRequired = false

        var gameCategory = UIMutableUserNotificationCategory()
        gameCategory.identifier = "gameCategory"
        gameCategory.setActions([playRock, playPaper, playScissors], forContext: UIUserNotificationActionContext.Default)
       
        categories.addObject(gameCategory)
        //var settings = UIUserNotificationSettings(forTypes: (.Alert | .Badge | .Sound), categories: categories as Set<NSObject>) //swift 1.1
        //let categoriesSet = NSSet(object: categories) as! Set< UIUserNotificationCategory>
        var settings = UIUserNotificationSettings(forTypes: [.Alert, .Sound, .Badge], categories: NSSet(object: categories) as! Set< UIUserNotificationCategory>)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

