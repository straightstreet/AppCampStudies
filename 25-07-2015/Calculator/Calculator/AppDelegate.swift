//
//  AppDelegate.swift
//  Calculator
//
//  Created by User on 19.07.2015.
//  Copyright (c) 2015 User. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

   let brain: CalculatorBrain = CalculatorBrain()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: (([NSObject : AnyObject]!) -> Void)!) {

        //1. przetworzenie userInfo, wyciągnięcie parametrów operand1, operand2, operation
        //2. stworzenie instacji klasy CalculatorBrain
        //3. wywołanie funkcji reply z opowiedzią z CalculatorBrain

        if let inputDictionary = userInfo as? [String: String],
        operand1 = inputDictionary["operand1"],
        operand2 = inputDictionary["operand2"],
        operation = inputDictionary["operation"]
        {
            brain.operand1 = (operand1 as NSString).doubleValue
            brain.operand2 = (operand2 as NSString).doubleValue
            brain.operation = operation

            let result = brain.calculate()

            reply(["result": result])


        }

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

