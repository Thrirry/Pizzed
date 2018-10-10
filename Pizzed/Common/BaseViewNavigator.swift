//
//  BaseViewNavigator.swift
//  Pizzed
//
//  Created by Gone on 10/10/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

protocol BaseViewNavigator {
    func toMenu()
}

struct DefaultBaseViewNavigator: BaseViewNavigator {

    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func back() {
        self.navigation?.popViewController(animated: true)
    }
    
    func toMenu() {
        guard let navig = navigation else { return }
        let navigator = DefaultMenuNavigator(navigation: navig)
        navigator.toMenu()
    }
    
}
