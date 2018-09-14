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
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        let vc = HomeViewController()
//        let navigationController = UINavigationController(rootViewController: vc)
//
//        self.window?.rootViewController = navigationController
        self.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LaunchViewController")
        self.window?.makeKeyAndVisible()
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        Application.shared.configMainInterface(window: window)
//        self.window = window
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
        if let window = window {
            Application.shared.configMainInterface(window: window)
        }
    }
}
