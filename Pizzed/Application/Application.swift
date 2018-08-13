//
//  Application.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

struct Application {
    
    // MARK: - Singleton pattern
    static let shared = Application()
    
    private init() {}
    
    func configMainInterface(window: UIWindow){
        let navigationController = UINavigationController()
        
        let navigator = DefaultMenuNavigator(navigation: navigationController)
        window.rootViewController = navigationController
        navigator.toHome(window: window)
        
    }
    
    private func switchRootViewController(rootVC: UIViewController) {
        
    }
}
