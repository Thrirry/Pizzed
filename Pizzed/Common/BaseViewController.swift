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

    var disposeBag = DisposeBag()
    
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
    func setupNav() {
        self.navigationController?.isNavigationBarHidden = true
    }
    func loadViewFromNib(named: String) -> UITableViewCell {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: named, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UITableViewCell else {
            fatalError("Misconfigured cell type, \(nib)!")
        }
        return view
    }
    func onSlideMenuButtonPressed() {
        guard let menuVC: MenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else {
            fatalError("Misconfigured view controller!")
        }
        let navigation = UINavigationController(rootViewController: menuVC)
        let navigator = DefaultMenuNavigator(navigation: navigation)
        menuVC.viewModel = MenuViewModel(navigator: navigator)
//        menuVC.delegate = self as? MenuDelegate
//        self.view.addSubview(menuVC.view)
//        self.addChildViewController(menuVC)
        addChildVC(menuVC)
        menuVC.view.layoutIfNeeded()
        menuVC.view.frame=CGRect(x: 0, y: 0  - UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }, completion: nil)
    }
    func onCloseMenuClick() {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.view.frame = CGRect(x: 0, y: 0 - UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (_) -> Void in
//            self.view.removeFromSuperview()
//            self.removeFromParentViewController()
            self.removeChildVC()
        })
    }
    
    @objc func onCloseCollectionClick(_ sender: UIButton) {
        
//        sender.tag = 1
//        if sender.tag == 1 {
//         print("remove button actived")
//            sender.tag = 0
//            removeChildVC()
//        }
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.view.frame = CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (_) -> Void in
             self.removeChildVC()
        })
    }
    
    @objc func insideItemDetailsButtonPressed(_ sender: UIButton) {
        guard let itemDetailVC: ProductViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController else {
            fatalError("Misconfigured view controller!\(sender)")
        }
        
//        itemDetailVC.delegate = self as? ItemDetailsDelegate
        addChildVC(itemDetailVC)
        itemDetailVC.view.frame = CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            itemDetailVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            sender.isEnabled = true
        }, completion: nil)
    }
}
