//
//  ProductViewModel.swift
//  Pizzed
//
//  Created by Gone on 9/17/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ServicePlatform

final class ProductViewModel: ViewModelType {
    
//    typealias T =
    
    struct Input {}
    struct Output {}
    
    // MARK: - Properties
    private let navigator: ProductNavigator
    
    init(navigator: ProductNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: ProductViewModel.Input) -> ProductViewModel.Output {
        return Output()
    }
}
