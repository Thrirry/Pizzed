//
//  HomeViewController.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    // MARK: - Compulsory ones
    static func viewController() -> HomeViewController? {
        return Helper.getViewController(named: "HomeViewController", inSb: "Main")
    }
    
    var viewModel:HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Home"
    logoImageView.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
    }

}
