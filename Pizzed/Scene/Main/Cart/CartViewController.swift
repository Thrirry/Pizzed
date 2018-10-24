//
//  CartViewController.swift
//  Pizzed
//
//  Created by Gone on 10/5/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CartViewController: BaseViewController, UITableViewDelegate,
UITableViewDataSource{
    
    @IBOutlet weak var rightBarContainView: UIView!
    @IBOutlet weak var itemOrderTableView: UITableView!
    @IBOutlet weak var iconCategoryContainView: UIView!
    @IBOutlet weak var titleCategoryContainView: UIView!
    @IBOutlet weak var btnCategory: UIButton!
    
    var viewModel: CartViewModel!
    
    // MARK: - Compulsory ones
    static func viewController() -> CartViewController? {
            return Helper.getViewController(named: "CartViewController", inSb: "Main")
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        view.backgroundColor = .white
        setupIUs()
        setupColor()
    }
    private func bind() {
        
    }
    
    func setupIUs() {
        let previousBtn = UIButton()
        view.addSubview(rightBarContainView)
        view.addSubview(itemOrderTableView)
        view.addSubview(previousBtn)
        view.addSubview(iconCategoryContainView)
        view.addSubview(titleCategoryContainView)
        
        setupPreviousButton(btn: previousBtn)
        setupRightBarView(rightBarContainView: rightBarContainView)
        setupItemsTableView(itemOrderTableView: itemOrderTableView)
        setupChildRightBar()
    }
    
    func setupChildRightBar(){
        iconCategoryContainView.translatesAutoresizingMaskIntoConstraints = false
        iconCategoryContainView.topAnchor.constraint(equalTo: rightBarContainView.topAnchor).isActive = true
        iconCategoryContainView.leftAnchor.constraint(equalTo: rightBarContainView.leftAnchor, constant: 5).isActive = true
        iconCategoryContainView.rightAnchor.constraint(equalTo: rightBarContainView.rightAnchor, constant: -5).isActive = true
        iconCategoryContainView.heightAnchor.constraint(equalTo: rightBarContainView.heightAnchor, multiplier: 0.07).isActive = true
        
        iconCategoryContainView.addSubview(btnCategory)
        btnCategory.translatesAutoresizingMaskIntoConstraints = false
        btnCategory.centerYAnchor.constraint(equalTo: iconCategoryContainView.centerYAnchor).isActive = true
        btnCategory.centerXAnchor.constraint(equalTo: iconCategoryContainView.centerXAnchor).isActive = true
        btnCategory.heightAnchor.constraint(equalTo: iconCategoryContainView.heightAnchor, multiplier: 1).isActive = true
        btnCategory.widthAnchor.constraint(equalTo: iconCategoryContainView.widthAnchor, multiplier: 1).isActive = true
        btnCategory.setBackgroundImageForButton(urlImg: "btnCart", btnNamed: btnCategory)
        setCategoriesButton(btn: btnCategory)
        
        titleCategoryContainView.translatesAutoresizingMaskIntoConstraints = false
        titleCategoryContainView.topAnchor.constraint(equalTo: iconCategoryContainView.bottomAnchor, constant: 10).isActive = true
        titleCategoryContainView.leftAnchor.constraint(equalTo: rightBarContainView.leftAnchor, constant: 5).isActive = true
        titleCategoryContainView.rightAnchor.constraint(equalTo: rightBarContainView.rightAnchor, constant: -5).isActive = true
        titleCategoryContainView.heightAnchor.constraint(equalTo: rightBarContainView.heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func setupColor(){
        rightBarContainView.backgroundColor = UIColor.FlatColor.RightBar.background
        iconCategoryContainView.backgroundColor = UIColor.clear
//        titleCategoryContainView.backgroundColor = UIColor.FlatColor.Background.RightBarBackground
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = loadViewFromNib(named: "CartTableViewCell") as! CartTableViewCell
        
        return cell
    }
    
}
