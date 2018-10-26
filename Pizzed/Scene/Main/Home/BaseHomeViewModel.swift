//
//  BaseHomeViewModel.swift
//  Pizzed
//
//  Created by Gone on 10/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Action

class BaseHomeViewModel {

    let pizzaService: PizzaServiceProtocol
    let bag = DisposeBag()
    
    // MARK: - Input
    
    // MARK: - Output
    private(set) var pizzaList: Variable<[Pizza]>
    private(set) var isLoadingData = Variable(false)
    private(set) var loadDataAction: Action<String, [Pizza]>!
    
    init(pizzaService: PizzaServiceProtocol) {
        self.pizzaService = pizzaService
        
        self.pizzaList = Variable<[Pizza]>([])
        bindOutput()
    }
    
    private func bindOutput() {
        loadDataAction = Action { [weak self] sender in
            print(sender)
            self?.isLoadingData.value = true
            guard let this = self else { return Observable.never() }
            return this.pizzaService.pizzaList(input: PizzaListInput())
                .map({ (output) -> [Pizza] in
                    return output.repositories ?? []
                })
        }
        
        loadDataAction
            .elements
            .subscribe(onNext: { [weak self] (pizzaList) in
                self?.pizzaList.value = pizzaList
                self?.isLoadingData.value = false
            })
            .disposed(by: bag)
        
        loadDataAction
            .errors
            .subscribe(onError: { [weak self](error) in
                self?.isLoadingData.value = false
                print(error)
            })
            .disposed(by: bag)
    }
}
