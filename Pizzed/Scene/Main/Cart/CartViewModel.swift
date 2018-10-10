//
//  CartViewModel.swift
//  Pizzed
//
//  Created by Gone on 10/5/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ServicePlatform

class CartViewModel: ViewModelType {
    
    typealias T = Constants.RightBar
    public typealias RightBarData = (UIImage, String)
    
    // MARK: - Properties
    private let navigator: DefaultCartNavigator
    private let disposeBag = DisposeBag()
    private let error = PublishSubject<(String, String)?>()
    private let data: Variable<[RightBarData]> = Variable([])
    
    // MARK: - Input, Output
    struct Input {
        let selection: Driver<IndexPath>
    }
    struct Output {}
    
    init(navigator: DefaultCartNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: CartViewModel.Input) -> CartViewModel.Output {
        return Output()
    }
}
