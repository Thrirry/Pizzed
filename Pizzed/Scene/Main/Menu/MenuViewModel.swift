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
import ServicePlatform

final class MenuViewModel: ViewModelType {

    typealias T = Constants.Types
    public typealias MenuData = (UIImage, String)
//    public typealias MenuData = (String)
    
    // MARK: - Properties
    private let navigator: MenuNavigator
    private let disposeBag = DisposeBag()
    private let error = PublishSubject<(String, String)?>()
//    private let data: Variable<[String]> = Variable([])
    private let data: Variable<[MenuData]> = Variable([])
    
    // MARK: - Input, Output
    struct Input {
        let selection: Driver<IndexPath>
    }

    struct Output {
        let menu: Driver<[MenuData]>
        let selectedMenu: Driver<(String, IndexPath)>
        let error: Driver<(String, String)?>
    }
    
    init(navigator: MenuNavigator) {
        self.navigator = navigator
        data.value = [(#imageLiteral(resourceName: "mainLogo"), T.PizzaWorld),(#imageLiteral(resourceName: "btnCart") ,T.Cart),(#imageLiteral(resourceName: "btnMap.png"),T.Map),(#imageLiteral(resourceName: "btnClock"),T.Clock),(#imageLiteral(resourceName: "btnTelephone"),T.Telephone),(#imageLiteral(resourceName: "btnBackSmall"),T.Back)]
    }
    
    func transform(input: MenuViewModel.Input) -> MenuViewModel.Output {
        let menu = data.asDriver()
        
        let selectedMenu = input.selection.withLatestFrom(menu) { (indexPath, menu) -> (String, IndexPath) in
            return(menu[indexPath.row].1, indexPath)
            }.do(onNext: navigator.toMenuDetails)
        
        return Output(menu: menu,
                      selectedMenu: selectedMenu,
                      error: error.asDriver(onErrorJustReturn: nil))
        
    }
}
