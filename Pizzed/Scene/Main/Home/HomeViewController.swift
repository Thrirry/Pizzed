//
//  HomeViewController.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

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
        rightBar.fetchJSON { [weak self] in
            self?.rightBarTableView.reloadData()
            count += 1
            if count == 2 {
                Helper.hideLoading()
            }
        }
        pizza.fetchJSON { [weak self] in
            self?.leftBarTableView.reloadData()
            count += 1
            if count == 2 {
                Helper.hideLoading()
            }
        }
        setupLayout()
        setupColour()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftBarTableView {
            return pizza.serviceProduct.count
        }
        if tableView == rightBarTableView {
            return rightBar.rightBarData.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftBarTableView {
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
        } else {
            let cell = loadViewFromNib(named: "RightBarTableViewCell") as! RightBarTableViewCell
            cell.backgroundColor = UIColor.FlatColor.Background.HomeBackground
            let data = rightBar.rightBarData[indexPath.row]
//            cell.displayContent(image: rightbar.images[indexPath.row], title: data.name)
            cell.displayContent(image: data.iconBackground, title: data.iconName)
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftBarTableView {
        } else {
            let taped = rightBar.rightBarData[indexPath.row].iconName
            if taped == "Hey" {
                onSlideMenuButtonPressed()
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.leftBarTableView {
            return 210
        }
        if tableView == self.rightBarTableView {
            return 90
        }
        return 0
    }
    func setupLayout() {
        // MARK: - Left Bar
        leftBarTableView.translatesAutoresizingMaskIntoConstraints = false
        leftBarTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        leftBarTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        leftBarTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        leftBarTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        // MARK: - Right Bar
        rightBarTableView.translatesAutoresizingMaskIntoConstraints = false
        rightBarTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        rightBarTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        rightBarTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        rightBarTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18).isActive = true
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
