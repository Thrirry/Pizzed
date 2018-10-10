//
//  CartNavigator.swift
//  Pizzed
//
//  Created by Gone on 10/5/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

protocol CartDetailsNavigator {
    func back()
    func toCartDetails()
}

struct DefaultCartNavigator: CartDetailsNavigator {
    
    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func back(){
        self.navigation?.popViewController(animated: true)
    }
    
    func toCartDetails() {
        guard let vc = CartViewController.viewController() else {
            return
        }
        vc.viewModel = CartViewModel(navigator: self)
        navigation?.pushViewController(vc, animated: true)
    }
    
    func toMenu(title: String) {
        guard let navig = navigation else { return }
        let navigator = DefaultMenuNavigator(navigation: navig)
        navigator.toMenu()
    }
}
