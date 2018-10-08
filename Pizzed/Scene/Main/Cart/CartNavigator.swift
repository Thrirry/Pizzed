//
//  CartNavigator.swift
//  Pizzed
//
//  Created by Gone on 10/5/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

protocol CartDetailsNavigator {
    func toCartDetails()
}

struct DefaultCartNavigator: CartDetailsNavigator {
    
    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func toCartDetails() {
        print("test- arrived cart")
//        guard let vc = CartViewController.viewController() else {
//            return
//        }
//        vc.viewModel = CartViewModel(navigator: self)
//        navigation?.pushViewController(vc, animated: true)
    }
}
