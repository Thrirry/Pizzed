//
//  MapViewModel.swift
//  Pizzed
//
//  Created by Gone on 10/8/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class MapViewModel: ViewModelType {
    struct Input {}
    struct Output {}
    
    private let navigator: DefaultMapNavigator
    
    init(navigator: DefaultMapNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: MapViewModel.Input) ->
        MapViewModel.Output {
            return Output()
    }
}
