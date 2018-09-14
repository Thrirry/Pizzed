//
//  MenuViewModel.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MenuViewModel: ViewModelType {

    typealias T = Constants.Types
    // MARK: - Properties
    private let navigator: MenuNavigator
    // MARK: - Input, Output
    struct Input {}
    struct Output {}
    init(navigator: MenuNavigator) {
        self.navigator = navigator
    }
    func transform(input: MenuViewModel.Input) -> MenuViewModel.Output {
        return Output()
    }
}
