//
//  MenuViewController.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import ServicePlatform

class MenuViewController: BaseViewController{
    @IBOutlet weak var menuTableView: UITableView!
    // MARK: - Compulsory ones
    static func viewController() -> MenuViewController? {
        return Helper.getViewController(named: "MenuViewController", inSb: "Main")
    }
//    var viewModel = FirstSuperStar()
    var viewModel: MenuViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setupColor()
        
        configureTableView()
        bind()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        menuTableView.register(nib, forCellReuseIdentifier: "MenuTableViewCell")
    }
    
    private func configureTableView() {
        registerCell()
        menuTableView.rowHeight = 95
    }
    
    public func bind() {
        let input = MenuViewModel.Input(selection: menuTableView.rx.itemSelected.asDriver())
        let output = viewModel.transform(input: input)
        
        output.menu.drive(menuTableView.rx.items(cellIdentifier: "MenuTableViewCell", cellType: MenuTableViewCell.self)) { _, data, cell in
                cell.bind(data)
                cell.backgroundColor = UIColor.FlatColor.Menu.background
                let backgroundView = UIView()
                backgroundView.backgroundColor = UIColor.FlatColor.Menu.hover
                cell.selectedBackgroundView = backgroundView
            }.disposed(by: disposeBag)
        output.error.ignoreNil().drive(onNext: showError).disposed(by: disposeBag)
        output.selectedMenu.drive().disposed(by: disposeBag)
    }
    
    private func showError(title: String, msg: String) {
        showPopup(title: title, message: msg, handler: {  _ in
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setUpLayout() {
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.83).isActive = true
        menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuTableView.showsVerticalScrollIndicator = false
        menuTableView.showsHorizontalScrollIndicator = false
    }
    
    func setupColor() {
        menuTableView.separatorColor  = UIColor.clear
        menuTableView.backgroundColor = UIColor.FlatColor.Menu.background
        view.backgroundColor = UIColor.FlatColor.Menu.background
    }
}
