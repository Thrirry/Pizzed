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
    func toMenu()
    func toBack()
}
struct DefaultMenuNavigator: MenuNavigator {
    
    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }

//    func toHome() {
//        guard let vc = HomeViewController.viewController() else { return }
//        let nav = UINavigationController(rootViewController: vc)
//        let navigator = DefaultHomeNavigator(navigation: nav)
//        vc.viewModel = HomeViewModel(navigator: navigator)
//        navigation?.pushViewController(vc, animated: true)
//    }
    
    func toHome() {
//        guard let navig = navigation else { return }
//        let navigator = DefaultHomeNavigator(navigation: navig)
//        navigator.toHome()
        navigation?.popToRootViewController(animated: true)
    }
    
    func toMenuDetails(title: String, indexPath: IndexPath) {
        switch indexPath.row {
        case Menu.Cart:
            toCartDetails(title: title)
        case Menu.Map:
            toMapDetails(title: title)
        case Menu.Back:
            toBack()
        default:
            toHome()
        }
    }
    
    public func toCartDetails(title: String) {
        guard let navig = navigation else { return }
        let navigator = DefaultCartNavigator(navigation: navig)
        navigator.toCartDetails()
    }

    public func toMapDetails(title: String){
        guard let navig = navigation else { return }
        let navigator = DefaultMapNavigator(navigation: navig)
        navigator.toMapDetails()
    }
    
    func toMenu() {
        guard let vc = MenuViewController.viewController() else {
            return
        }
        vc.viewModel = MenuViewModel(navigator: self)
        navigation?.pushViewController(vc, animated: true)
    }
    
    func toBack() {
        self.navigation?.popViewController(animated: true)
//        self.navigation?.popToRootViewController(animated: true)
    }
}
