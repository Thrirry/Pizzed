//
//  HomeViewController.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ServicePlatform
//import RxAlamofire

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var rightBarTableView: UITableView!
    @IBOutlet weak var leftBarTableView: UITableView!

    var viewModel: HomeViewModel!
    private var refreshControl: UIRefreshControl!
    
    // MARK: - Compulsory ones
    static func viewController() -> HomeViewController? {
        return Helper.getViewController(named: "HomeViewController", inSb: "Main")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIs()
        setupColor()
        configureTableView()
        
        bind()
        viewModel.loadDataAction.execute("First load")
    }
    
    private func registerCell() {
        leftBarTableView.register(UINib(nibName: "PizzaTableViewCell", bundle: nil), forCellReuseIdentifier: "PizzaTableViewCell")
        
        rightBarTableView.register(UINib(nibName: "RightBarTableViewCell", bundle: nil), forCellReuseIdentifier: "RightBarTableViewCell")
    }
    
    private func configureTableView() {
        registerCell()
        leftBarTableView.refreshControl = UIRefreshControl()
        rightBarTableView.rowHeight = 90
        leftBarTableView.rowHeight = 210
    }
    
    func setupUIs() {
        setupItemTableView(itemOrderTableView: leftBarTableView)
        setupRightBarView(rightBarContainView: rightBarTableView)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: Constants.Refresh.refreshTitle)
        leftBarTableView.addSubview(refreshControl)
    }
    
    func setupColor() {
        view.backgroundColor = UIColor.FlatColor.mainBackground
        leftBarTableView.backgroundColor = UIColor.FlatColor.Product.background
        leftBarTableView.separatorColor = UIColor.clear
        rightBarTableView.backgroundColor = UIColor.FlatColor.Product.background
        rightBarTableView.separatorColor = UIColor.FlatColor.mainBackground
    }
}

extension HomeViewController {
    public func bind() {
        let pull = leftBarTableView.refreshControl!.rx.controlEvent(.valueChanged).asDriver()
        
        let input = HomeViewModel.Input(pull: pull, pizzaSelected: leftBarTableView.rx.itemSelected.asDriver(), selection: rightBarTableView.rx.itemSelected.asDriver())
        
        let output = viewModel.transform(input: input)
        
        output.menuItems.drive(rightBarTableView.rx.items(cellIdentifier: "RightBarTableViewCell", cellType: RightBarTableViewCell.self)) {_, data, cell in
            cell.bind(data)
            }.disposed(by: disposeBag)
        
        output.error.ignoreNil().drive(onNext: showError).disposed(by: disposeBag)
        output.selectedRightBar.drive().disposed(by: disposeBag)
        
        output.pizzas.drive(leftBarTableView.rx.items(cellIdentifier: "PizzaTableViewCell", cellType: PizzaTableViewCell.self)) { _, data, cell in
            cell.pizza = data
            }.disposed(by: disposeBag)
        
        output.pizzaSelected.drive().disposed(by: disposeBag)
    }
    
    private func showError(title: String, msg: String) {
        showPopup(title: title, message: msg, handler: {  _ in
        })
    }
}
