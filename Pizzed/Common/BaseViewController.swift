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

    
    func onSlideMenuButtonPressed(){
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
    
        menuVC.delegate = self as? MenuDelegate
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()
        
        menuVC.view.frame=CGRect(x: 0, y: 0  - UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            
        }, completion:nil)
        
    }
    
    func onCloseMenuClick(){
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.view.frame = CGRect(x: 0, y: 0 - UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
}
