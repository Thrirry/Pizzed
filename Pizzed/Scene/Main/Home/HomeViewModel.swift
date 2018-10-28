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
import ServicePlatform
import Action
import SwinjectStoryboard

class HomeViewModel: ViewModelType {
    
    typealias T = Constants.Menu
    public typealias RightBarData = (UIImage, String)
    var pizzaService: PizzaServiceProtocol
    
    // MARK: - Properties
    private let navigator: HomeNavigator
    private let disposeBag = DisposeBag()
    private let error = PublishSubject<(String, String)?>()
    private let data: [RightBarData]
    
    private let pizzaList = Variable<[Pizza]>([])
    private let isLoadingData = Variable(false)
    private(set) var loadDataAction: Action<String, [Pizza]>!
    // MARK: - Input, Output
    struct Input {
        let pull: Driver<()>
        let pizzaSelected: Driver<IndexPath>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let pizzas: Driver<[Pizza]>
        let menuItems: Driver<[RightBarData]>
        let selectedRightBar: Driver<(String, IndexPath)>
        let pizzaSelected: Driver<Pizza>
        let error: Driver<(String, String)?>
    }
    
    init(navigator: HomeNavigator) {
        self.navigator = navigator
        self.pizzaService = SwinjectStoryboard.defaultContainer.resolve(PizzaServiceProtocol.self)!
        
        data = [(#imageLiteral(resourceName: "mainLogo.png"),T.Hey),(#imageLiteral(resourceName: "btnMarine"),T.Marine),(#imageLiteral(resourceName: "btnMeat"),T.MultiMeat),(#imageLiteral(resourceName: "btnChili"),T.Chili),(#imageLiteral(resourceName: "btnCheese"),T.Cheese),(#imageLiteral(resourceName: "btnPineapple"),T.Pineapple),(#imageLiteral(resourceName: "btnSalad"),T.Salad),(#imageLiteral(resourceName: "btnStrawberry"),T.Strawberry),(#imageLiteral(resourceName: "btnVegetarian"),T.Vegetarian),(#imageLiteral(resourceName: "btnMushroom"),T.Mushroom),(#imageLiteral(resourceName: "btnOlive"),T.Olives),(#imageLiteral(resourceName: "btnOnion"),T.Onion),(#imageLiteral(resourceName: "btnNew"),T.News),(#imageLiteral(resourceName: "btnDrinks"),T.Drinks)]
    }
    
    func transform(input: HomeViewModel.Input) -> HomeViewModel.Output {
        getListPizza()
        pullToFresh(trigger: input.pull)
        
        let menuItems = Driver.just(data)
        
        let selectedRightBar = input.selection.withLatestFrom(menuItems) { (indexPath, menuItems) -> (String, IndexPath) in
            return(menuItems[indexPath.row].1, indexPath)
        }.do(onNext: navigator.toRightBarDetails).asDriver()
        
        let pizzaSelected = input.selection.withLatestFrom(pizzaList.asDriver()) { (indexPath, pizzas) -> Pizza in
            return pizzas[indexPath.row]
            }.do(onNext: navigator.toDetails).asDriver()
        
        return Output(pizzas: pizzaList.asDriver(), menuItems: menuItems, selectedRightBar: selectedRightBar, pizzaSelected: pizzaSelected, error: error.asDriver(onErrorJustReturn: nil))
    }
    
    private func getListPizza() {
        loadDataAction = Action { [weak self] sender in
            print(sender)
            self?.isLoadingData.value = true
            guard let `self` = self else { return Observable.never() }
            return self.pizzaService.pizzaList(input: PizzaListInput())
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
            .disposed(by: disposeBag)
        
        loadDataAction
            .errors
            .subscribe(onError: { [weak self](error) in
                self?.isLoadingData.value = false
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    private func pullToFresh(trigger: Driver<()>) {
        trigger.flatMapLatest { [unowned self] _ -> Driver<[Pizza]> in
            return self.loadDataAction.elements.asDriver([])
            }.drive(onNext: { [weak self] (pizzas) in
                self?.pizzaList.value = pizzas
            }).disposed(by: disposeBag)
    }
}
