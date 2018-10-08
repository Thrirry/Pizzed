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

class CartViewController: BaseViewController {

    // MARK: - Compulsory ones
    static func viewController() -> CartViewController? {
        return Helper.getViewController(named: "CartViewController", inSb: "Main")
    }
    var viewModel: CartViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
