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
import RxAlamofire

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var rightBarTableView: UITableView!
    @IBOutlet weak var leftBarTableView: UITableView!

    private var refreshControl: UIRefreshControl!
    fileprivate var navigator: Application!
    var viewModel: BaseHomeViewModel!
    var mainViewModel: HomeViewModel!
    
    // MARK: - Compulsory ones
    static func viewController() -> HomeViewController? {
        return Helper.getViewController(named: "HomeViewController", inSb: "Main")
    }
    
    static func createWith(navigator: Application, storyboard: UIStoryboard, viewModel: BaseHomeViewModel) -> HomeViewController {
        
        let controller = storyboard.instantiateViewController(ofType: HomeViewController.self)
        
        controller.navigator = navigator
        controller.viewModel = viewModel
        
        return controller
    }
    
    override func viewDidLoad() {
        
        setupUIs()
        setupColor()
        configureTableView()
//        bind()
        bindUI()
        viewModel.loadDataAction.execute("First load")
    }
    
    private func registerCell() {
        leftBarTableView.register(UINib(nibName: "PizzaTableViewCell", bundle: nil), forCellReuseIdentifier: "PizzaTableViewCell")
        
        rightBarTableView.register(UINib(nibName: "RightBarTableViewCell", bundle: nil), forCellReuseIdentifier: "RightBarTableViewCell")
    }
    
    private func configureTableView() {
        registerCell()
        rightBarTableView.rowHeight = 90
        leftBarTableView.rowHeight = 210
    }
    
    private func bindUI(){
//        self.navigationItem.rightBarButtonItem?.rx
//            .bind(to: viewModel.loadDataAction) { _ in return "Refresh button" }
        viewModel
            .pizzaList
            .asObservable()
            .bind(to: leftBarTableView.rx.items) { [weak self] tableView, index, _
                in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: PizzaTableViewCell.cellIdentifier, for: indexPath)
                self?.config(cell, at: indexPath)
                return cell
            }
            .disposed(by: disposeBag)
    
        viewModel.isLoadingData
            .asDriver()
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)
        
//        leftBarTableView.rx
//            .modelSelected(Pizza.self)
//            .subscribe(onNext: { [weak self](pizza) in
//                guard let this = self else {return}
//                self?.navigator.show(segue: .pizzaDetailLists(pizza: Variable(pizza)), sender: this)
//                })
//            .disposed(by: disposeBag)
        
        let modelSelected = leftBarTableView.rx.modelSelected(Pizza.self).asObservable()
        
        let cellSelected = leftBarTableView.rx.itemSelected.asObservable()
            .map { [weak self] indexPath -> UITableViewCell in
                guard let cell = self?.leftBarTableView.cellForRow(at: indexPath) else { fatalError("Expected cell at indexpath") }
                return cell
        }
        
        Observable.zip(cellSelected, modelSelected)
            .subscribe(onNext: { [weak self] category, pizza in
                guard let this = self else { fatalError() }
                self?.navigator.show(segue: .pizzaDetailLists(pizza: Variable(pizza)), sender: this)
                print(category)
            })
            .disposed(by: disposeBag)
    
        refreshControl.rx
            .bind(to: viewModel.loadDataAction, controlEvent: refreshControl.rx.controlEvent(.valueChanged)) { _ in
                return " "
        }
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
    
    private func config(_ cell: UITableViewCell, at indexPath: IndexPath) {
        if let cell = cell as? PizzaTableViewCell {
            cell.pizza = viewModel.pizzaList.value[indexPath.row]
        }
    }
}

extension HomeViewController {
    
    private func bind() {
        let input = HomeViewModel.Input(selection: rightBarTableView.rx.itemSelected.asDriver())
        let output = mainViewModel.transform(input: input)
        
        output.rightBar.drive(rightBarTableView.rx.items(cellIdentifier: "RightBarTableViewCell", cellType: RightBarTableViewCell.self)) {_, data, cell in
            cell.bind(data)
            }.disposed(by: disposeBag)
        
        output.error.ignoreNil().drive(onNext: showError).disposed(by: disposeBag)
        output.selectedRightBar.drive().disposed(by: disposeBag)
    }
    
    private func showError(title: String, msg: String) {
        showPopup(title: title, message: msg, handler: {  _ in
        })
    }
}
