//
//  PizzaService.swift
//  Pizzed
//
//  Created by Gone on 10/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

import RxSwift

protocol PizzaServiceProtocol {
    func pizzaList(input: PizzaListInput) -> Observable<PizzaListOutput>
    func pizzaDetailList(input: PizzaDetailListInput) -> Observable<PizzaDetailListOutput>
}

class PizzaService: APIService, PizzaServiceProtocol {
    
    func pizzaList(input: PizzaListInput) -> Observable<PizzaListOutput> {
        return self.request(input)
            .observeOn(MainScheduler.instance)
            .share(replay: 1)
    }

    func pizzaDetailList(input: PizzaDetailListInput) -> Observable<PizzaDetailListOutput> {
        return self.requestArray(input)
            .observeOn(MainScheduler.instance)
            .map { pizzaDetail -> PizzaDetailListOutput in
                return PizzaDetailListOutput(pizzaDetail: pizzaDetail)
            }
            .share(replay: 1)
    }
}
