//
//  Application.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwinjectStoryboard

class Application {
    lazy private var defaultStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    // MARK: - segues list
    enum Segue {
        case pizzaList
        case pizzaDetailLists(pizza: Variable<Pizza>)
    }
    
    static let shared = Application()
    
    // MARK: - invoke a single segue
    // swiftlint:disable force_unwrapping
    func show(segue: Segue, sender: UIViewController) {
        switch segue {
        case .pizzaList:
            let viewModel = BaseHomeViewModel(pizzaService: SwinjectStoryboard.defaultContainer.resolve(PizzaServiceProtocol.self)!)
            show(target: HomeViewController.createWith(navigator: self, storyboard: defaultStoryboard, viewModel: viewModel), sender: sender)
            
        case .pizzaDetailLists(let pizza):
            let viewModel = ProductViewModel(pizzaService: SwinjectStoryboard.defaultContainer.resolve(PizzaServiceProtocol.self)!, pizza: pizza)
            present(target: ProductViewController.createWith(navigator: self, storyboard: defaultStoryboard, viewModel: viewModel), sender: sender)
        }
    }
    
    private func show(target: UIViewController, sender: UIViewController) {
        if let nav = sender as? UINavigationController {
            nav.pushViewController(target, animated: false)
        } else if let nav = sender.navigationController {
            nav.pushViewController(target, animated: true)
        }
    }
    
    private func present(target: UIViewController, sender: UIViewController) {
        if let nav = sender as? UINavigationController {
            nav.presentCollectionView(target)
        } else if let nav = sender.navigationController {
            nav.presentCollectionView(target)
        }
    }
}
