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

class HomeViewModel: ViewModelType {
    
    typealias T = Constants.Menu
    public typealias RightBarData = (UIImage, String)
    // MARK: - Properties
    private let navigator: HomeNavigator
    private let disposeBag = DisposeBag()
    private let error = PublishSubject<(String, String)?>()
    private let data: Variable<[RightBarData]> = Variable([])
    
    // MARK: - Input, Output
    struct Input {
        let selection: Driver<IndexPath>
    }
    struct Output {
        let rightBar: Driver<[RightBarData]>
        let selectedRightBar: Driver<(String, IndexPath)>
        let error: Driver<(String, String)?>
    }
    
    init(navigator: HomeNavigator) {
        self.navigator = navigator
        data.value = [(#imageLiteral(resourceName: "mainLogo.png"), T.Hey), (#imageLiteral(resourceName: "btnMarine"), T.Marine),  (#imageLiteral(resourceName: "btnMeat"), T.MultiMeat),  (#imageLiteral(resourceName: "btnChili"), T.Chili), (#imageLiteral(resourceName: "btnCheese"), T.Cheese), (#imageLiteral(resourceName: "btnPineapple"), T.Pineapple), (#imageLiteral(resourceName: "btnSalad"), T.Salad), (#imageLiteral(resourceName: "btnStrawberry"), T.Strawberry), (#imageLiteral(resourceName: "btnVegetarian"), T.Vegetarian), (#imageLiteral(resourceName: "btnMushroom"), T.Mushroom), (#imageLiteral(resourceName: "btnOlive"), T.Olives), (#imageLiteral(resourceName: "btnOnion"), T.Onion), (#imageLiteral(resourceName: "btnNew"), T.News), (#imageLiteral(resourceName: "btnDrinks"), T.Drinks)]
    }

    func transform(input: HomeViewModel.Input) -> HomeViewModel.Output {
        let rightBar = data.asDriver()
        
        let selectedRightBar = input.selection.withLatestFrom(rightBar) { (indexPath, rightBar) -> (String, IndexPath) in
            return(rightBar[indexPath.row].1, indexPath)
        }.do(onNext: navigator.toRightBarDetails)
        
        return Output(rightBar: rightBar, selectedRightBar: selectedRightBar, error: error.asDriver(onErrorJustReturn: nil))
    }
}
