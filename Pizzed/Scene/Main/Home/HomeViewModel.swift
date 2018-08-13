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

final class HomeViewModel: ViewModelType {
    
    // MARK: - Input, Output
    struct Input {}
    struct Output {}
    
    // MARK: - Properties
    private let navigator: HomeNavigator
    
    init(navigator: HomeNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: HomeViewModel.Input) -> HomeViewModel.Output {
        return Output()
    }
}

