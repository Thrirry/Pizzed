//
//  HomeNavigator.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

protocol HomeNavigator {
    func toHome()
}
struct DefaultHomeNavigator: HomeNavigator {
    private weak var navigation: UINavigationController?
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    func toHome() {
        guard let vc = HomeViewController.viewController() else { return }
        vc.viewModel = HomeViewModel(navigator: self)
        navigation?.pushViewController(vc, animated: true)
    }
}
