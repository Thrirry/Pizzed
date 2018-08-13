//
//  HomeViewModel.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewModel: ViewModelType {
    
    typealias T = Constants.Types
    
    // MARK: - Properties
    private let navigator: HomeNavigator
    
    // MARK: - Input, Output
    struct Input {}
    struct Output {}
    
    
    init(navigator: HomeNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: HomeViewModel.Input) -> HomeViewModel.Output {
        return Output()
    }
}

