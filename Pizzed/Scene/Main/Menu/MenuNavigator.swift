//
//  MenuNavigator.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

protocol MenuNavigator {
    func toMenuDetails(title: String, indexPath: IndexPath)
}
struct DefaultMenuNavigator: MenuNavigator {
    
    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }

    func toHome() {
        guard let vc = HomeViewController.viewController() else { return }
        let nav = UINavigationController(rootViewController: vc)
        let navigator = DefaultHomeNavigator(navigation: nav)
        vc.viewModel = HomeViewModel(navigator: navigator)
        navigation?.pushViewController(vc, animated: true)
    }
    
    func toMenuDetails(title: String, indexPath: IndexPath) {
        switch indexPath.row {
        case Menu.Cart:
            toCartDetails(title: title)
            print(title)
        default:
            toHome()
        }
    }
    
    private func toCartDetails(title: String) {
        print("here \(title)")
        guard let navigation = navigation else { return }
        let navigator = DefaultCartNavigator(navigation: navigation)
        navigator.toCartDetails()
    }

    func toMenu(window: UIWindow?) {
        let menuNavigationController = UINavigationController()
        let menuNavigator = DefaultMenuNavigator(navigation: menuNavigationController)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
           menuNavigationController
        ]
        
        if let window = window {
            window.rootViewController = tabBarController
        } else {
            self.navigation?.viewControllers.first?.setRootController(viewController: tabBarController)
        }
        menuNavigator.toHome()
    }
}
