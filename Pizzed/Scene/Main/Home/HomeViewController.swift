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

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var rightBarTableView: UITableView!
    @IBOutlet weak var leftBarTableView: UITableView!
    let rightBar = DataForRightbar.sharedInstance
    let pizza = DataForPizza.sharedInstance
    // MARK: - Compulsory ones
    static func viewController() -> HomeViewController? {
        return Helper.getViewController(named: "HomeViewController", inSb: "Main")
    }
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.showLoading()
        var count = 0

        pizza.fetchJSON { [weak self] in
            self?.leftBarTableView.reloadData()
            count += 1
            if count == 1 {
                Helper.hideLoading()
            }
        }
        setupLayout()
        setupColour()
        configureTableView()
        bind()
        // Do any additional setup after loading the view.
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "RightBarTableViewCell", bundle: nil)
        rightBarTableView.register(nib, forCellReuseIdentifier: "RightBarTableViewCell")
    }
    
    private func configureTableView() {
        registerCell()
        rightBarTableView.rowHeight = 90
    }
    
    private func bind() {
        let input = HomeViewModel.Input(selection: rightBarTableView.rx.itemSelected.asDriver())
        let output = viewModel.transform(input: input)
        
        output.rightBar.drive(rightBarTableView.rx.items(cellIdentifier: "RightBarTableViewCell", cellType: RightBarTableViewCell.self)) {_, data, cell in
            cell.bind(data)
            cell.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        }.disposed(by: disposeBag)
        
        output.error.ignoreNil().drive(onNext: showError).disposed(by: disposeBag)
        output.selectedRightBar.drive().disposed(by: disposeBag)
    }
    
    private func showError(title: String, msg: String) {
        showPopup(title: title, message: msg, handler: {  _ in
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizza.serviceProduct.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // swiftlint:disable force_cast
            let cell = loadViewFromNib(named: "PizzaTableViewCell") as! PizzaTableViewCell
            let mainData = pizza.serviceProduct[indexPath.row]
            let otherData = pizza.pizzaStore[indexPath.row]
            
            for info in mainData.productInfo {
               cell.displayTitle(title: info.name, state: info.state )
                
                for compositions in info.detail {
                    cell.displayComposition(composition: compositions.composition)
                }
            }
            for description in otherData.descriptions {
                cell.displayDescription(weight: description.weight, size: description.size, price: description.price)
            }
            for imageUrl in otherData.imageUrls {
                cell.displayProductImage(image: imageUrl.firstImg)
            }
            cell.orderBtn.addTarget(self, action: #selector(insideItemDetailsButtonPressed(_:)), for: .touchUpInside)
            cell.backgroundColor = UIColor.FlatColor.Background.HomeBackground
            cell.selectionStyle = .none
            return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    func setupLayout() {
        // MARK: - Left Bar
        setupItemsTableView(itemOrderTableView: leftBarTableView)
        // MARK: - Right Bar
        setupRightBarView(rightBarContainView: rightBarTableView)
    }
    func setupColour() {
        view.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        // MARK: - Left Bar
        leftBarTableView.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        leftBarTableView.separatorColor = UIColor.clear
        // MARK: - Right Bar
        rightBarTableView.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        rightBarTableView.separatorColor = UIColor.clear
    }
}
