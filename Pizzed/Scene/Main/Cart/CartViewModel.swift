//
//  CartViewModel.swift
//  Pizzed
//
//  Created by Gone on 10/5/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class CartViewModel: ViewModelType {
    // MARK: - Input, Output
    struct Input {}
    struct Output {}
    
    // MARK: - Properties
    private let navigator: DefaultCartNavigator
    
    init(navigator: DefaultCartNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: CartViewModel.Input) -> CartViewModel.Output {
        return Output()
    }
}
