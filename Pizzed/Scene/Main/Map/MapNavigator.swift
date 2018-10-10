//
//  MapNavigator.swift
//  Pizzed
//
//  Created by Gone on 10/8/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

protocol MapDetailsNavigator {
    func toMapDetails()
    func back()
}

struct DefaultMapNavigator: MapDetailsNavigator {
    
    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func toMapDetails() {
        guard let vc = MapViewController.viewController() else {
            return
        }
        vc.viewModel = MapViewModel(navigator: self)
        navigation?.pushViewController(vc, animated: true)
    }
    
    func back(){
        navigation?.popViewController(animated: true)
    }

}
