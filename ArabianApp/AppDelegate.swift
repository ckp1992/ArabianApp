//
//  AppDelegate.swift
//  ArabianApp
//
//  Created by 陈鲲鹏 on 14/11/26.
//  Copyright (c) 2014年 陈鲲鹏. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController : UINavigationController!


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "pushToState:", name: "pushToState", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "popBack:", name: "popBack", object: nil)
        navigationController = self.window!.rootViewController as UINavigationController
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
    
    //Push
    func pushToState(notification : NSNotification){
        let state:String = notification.userInfo?["state"] as NSString
        
        //http://stackoverflow.com/questions/24570345/nsclassfromstring-always-returns-nil
        let xibName=state+"ViewController"
        let controllerName="ArabianApp."+xibName
        
        var classType: AnyObject.Type=NSClassFromString(controllerName)
        var nsobjectype : UIViewController.Type = classType as UIViewController.Type
        var viewController: UIViewController = nsobjectype(nibName: xibName, bundle: nil)
        for (key, value) in notification.userInfo! {
            if !(key == "state") {
                viewController.setValue(value, forKey:(key as String))
            }
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    //Pop
    func popBack(notification : NSNotification){
        navigationController.popViewControllerAnimated(true)
    }

}

