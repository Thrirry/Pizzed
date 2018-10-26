//
//  HomeNavigator.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

protocol HomeNavigator {
    func toRightBarDetails(title: String, indexPath: IndexPath)
    func toHome()
}
struct DefaultHomeNavigator: HomeNavigator {
    
    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func toHome() {
        guard let vc = HomeViewController.viewController() else { return }
//        vc.mainViewModel = HomeViewModel(navigator: self)
        navigation?.pushViewController(vc, animated: true)
    }
    
    func toRightBarDetails(title: String, indexPath: IndexPath){
        switch indexPath.row {
        case RighBar.Hey:
            toMenu(title: title)
        default:
            toHome()
        }
    }

    func toMenu(title: String) {
        guard let navig = navigation else { return }
        let navigator = DefaultMenuNavigator(navigation: navig)
        navigator.toMenu()
    }
}
