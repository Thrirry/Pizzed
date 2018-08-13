//
//  MenuViewController.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Compulsory ones
    static func viewController() -> MenuViewController? {
        return Helper.getViewController(named: "MenuViewController", inSb: "Main")
    }
    
    var viewModel:MenuViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
