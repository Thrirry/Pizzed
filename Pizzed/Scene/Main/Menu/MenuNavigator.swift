//
//  MenuNavigator.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

protocol MenuNavigator {
    
}

struct DefaultMenuNavigator:MenuNavigator {
    
    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func toHome(window: UIWindow?) {
        guard let vc = HomeViewController.viewController() else { return }
        let nav = UINavigationController(rootViewController: vc)
        let navigator = DefaultHomeNavigator(navigation: nav)
        vc.viewModel = HomeViewModel(navigator: navigator)
        self.navigation?.viewControllers.first?.setRootController(viewController: nav)
    }
    
}
