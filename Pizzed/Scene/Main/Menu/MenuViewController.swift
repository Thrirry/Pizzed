//
//  MenuViewController.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
protocol MenuDelegate {
    func menuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var menuTableView: UITableView!
    var arrayIconOfMenuSlide = [IconMenuSlide]()
    var arrayMenuOptions = [Dictionary<String, String>] ()
    var delegate: MenuDelegate?
    // MARK: - Compulsory ones
    static func viewController() -> MenuViewController? {
        return Helper.getViewController(named: "MenuViewController", inSb: "Main")
    }
    var viewModel: MenuViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        binding()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    func updateArrayMenuOptions() {
        arrayMenuOptions.append(["title": "Home", "icon": "HomeIcon"])
        arrayMenuOptions.append(["title": "Play", "icon": "PlayIcon"])
        menuTableView.reloadData()
    }
    func binding() {
        arrayIconOfMenuSlide = [IconMenuSlide(cell: 0, image: #imageLiteral(resourceName: "MainLogo"), title: " "),
                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "logo-pizza-final"), title: "Pizza World"),
                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "Cart"), title: "Your Cart"),
                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "map-location"), title: "Coverage Area"),
                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "Telephone"), title: "Telephone"),
                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "alarm-clock"), title: "8AM - 11PM"),
                                IconMenuSlide(cell: 2, image: #imageLiteral(resourceName: "back-arrow-final"), title: " ") ]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayIconOfMenuSlide.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = loadViewFromNib(named: "MenuTableViewCell") as! MenuTableViewCell
        cell.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        if arrayIconOfMenuSlide[indexPath.row].cell == 0 {
            cell.data = nil
        }
        if arrayIconOfMenuSlide[indexPath.row].cell == 1 || arrayIconOfMenuSlide[indexPath.row].cell == 2 { cell.data = arrayIconOfMenuSlide[indexPath.row]
        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taped = arrayIconOfMenuSlide[indexPath.row].cell
        if taped == 2 {
            onCloseMenuClick()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupLayout() {
        menuTableView.translatesAutoresizingMaskIntoConstraints = false
        menuTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuTableView.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        menuTableView.showsVerticalScrollIndicator = false
        menuTableView.showsHorizontalScrollIndicator = false
        menuTableView.separatorColor  = UIColor.clear
    }
}
