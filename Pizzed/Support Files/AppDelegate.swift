//
//  AppDelegate.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigator = Application()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        Thread.sleep(forTimeInterval: 1.5)
        
//        self.window?.rootViewController = UINavigationController(rootViewController: LaunchViewController(nibName: nil, bundle: nil))
//        self.window?.makeKeyAndVisible()
        redirect()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

    func redirect() {
        
        if let nav = window?.rootViewController as? UINavigationController {
            navigator.show(segue: .pizzaList, sender: nav)
        }
    }
}
