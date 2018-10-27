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
import Action

class ProductViewModel {
    
    let pizzaService: PizzaServiceProtocol
    let bag = DisposeBag()
    
    // MARK: - Input
    private(set) var pizza: Variable<Pizza>
    // MARK: - Output
    private(set) var pizzaDetailList: Variable<[PizzaDetail]>
    
    init(pizzaService: PizzaServiceProtocol, pizza: Variable<Pizza>) {
        self.pizzaService = pizzaService
        self.pizza = pizza
        
        self.pizzaDetailList = Variable<[PizzaDetail]>([])
        bindOutput()
    }
    
    //swiftlint:disable force_unwrapping
    private func bindOutput() {
        pizza
            .asObservable()
            .filter { $0.name != nil && !$0.name!.isEmpty && (($0.detail?.composition) != nil) }
            .map { $0.name! }
            .flatMap({ pizzaFullName -> Observable<PizzaDetailListOutput> in
                return self.pizzaService.pizzaDetailList(input: PizzaDetailListInput(pizzaFullName: pizzaFullName))
            })
            .subscribe(onNext: { [weak self] (output) in
                self?.pizzaDetailList.value = output.pizzaDetail
                }, onError: { (error) in
                    print(error)
            })
        .disposed(by: bag)
    }
}
