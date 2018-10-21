//
//  ProductNavigator.swift
//  Pizzed
//
//  Created by Gone on 9/17/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
protocol ProductNavigator {
 
}

class DefaultProductNavigator: ProductNavigator {

    private weak var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}
