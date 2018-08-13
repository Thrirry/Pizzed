//
//  HomeViewController.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Compulsory ones
    static func viewController() -> HomeViewController? {
        return Helper.getViewController(named: "HomeViewController", inSb: "Main")
    }
    
    var viewModel:HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        // Do any additional setup after loading the view.
    }

}
