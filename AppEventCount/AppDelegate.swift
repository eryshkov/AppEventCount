//
//  AppDelegate.swift
//  AppEventCount
//
//  Created by Evgeniy Ryshkov on 17.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, VCDelegate {

    var window: UIWindow?
    
    var viewController: ViewController?
    
    var didFinishLaunchingCount: Int?

    func vcSend(viewController: UIViewController) { //VCDelegate required
        self.viewController = viewController as? ViewController
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
    
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        didFinishLaunchingCount = UserDefaults.standard.integer(forKey: "didFinishLaunchingCount") + 1
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        viewController?.willResignActiveCount += 1
        viewController?.updateView()
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        viewController?.didEnterBackgroundCount += 1
        viewController?.updateView()
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        viewController?.willEnterForegroundCount += 1
        viewController?.updateView()
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        viewController?.didBecomeActiveCount += 1
        viewController?.didFinishLaunchingCount = self.didFinishLaunchingCount ?? 0
        viewController?.willTerminateCount = UserDefaults.standard.integer(forKey: "willTerminateCount")
        viewController?.updateView()
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        viewController?.willTerminateCount += 1
        viewController?.updateView()
        UserDefaults.standard.set(didFinishLaunchingCount, forKey: "didFinishLaunchingCount")
        UserDefaults.standard.set(viewController?.willTerminateCount, forKey: "willTerminateCount")
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

