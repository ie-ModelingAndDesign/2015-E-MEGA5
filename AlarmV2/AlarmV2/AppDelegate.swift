//
//  AppDelegate.swift
//  AlarmV2
//
//  Created by Masataka on 2015/12/02.
//  Copyright © 2015年 Masataka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // register UILocalNotification permit
        UIApplication.sharedApplication().cancelAllLocalNotifications();
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: .Alert, categories: nil))

        // use NSUD and set default var
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.registerDefaults(["onOffStatus": false])
        defaults.registerDefaults(["startTime": "0000"])
        defaults.registerDefaults(["stopTime": "0000"])
        for i in 0...6 { defaults.registerDefaults(["weekFlags\(i)": false]) }
        defaults.registerDefaults(["initRandStringLen": 0])
        defaults.registerDefaults(["remaningNum": 0])
        
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