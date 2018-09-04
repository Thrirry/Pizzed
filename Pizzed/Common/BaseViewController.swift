//
//  BaseViewController.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupNav(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func loadViewFromNib(named: String) -> UITableViewCell {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: named, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UITableViewCell
        
//        let view = Bundle.main.loadNibNamed(named, owner: self, options: nil)?.first as! UITableViewCell
        
        return view
    }
}
