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
    
    func registerCell(tableView: UITableView, nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func onSlideMenuButtonPressed() {
        guard let menuVC = MenuViewController.viewController() else {
            return
        }
        let navigation = UINavigationController(rootViewController: menuVC)
        let navigator = DefaultMenuNavigator(navigation: navigation)
        menuVC.viewModel = MenuViewModel(navigator: navigator)
        addChildVC(navigation)
        
        menuVC.view.frame=CGRect(x: 0, y: 0 - UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
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
            self.removeChildVC()
        })
    }
    
    @objc func onCloseProductViewClick(_ sender: UIButton) {
        dismissCollectionView()
    }
    
    @objc func onOpenProductViewClick(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController
        {
            let navControllers = UINavigationController(rootViewController: vc)
            presentCollectionView(navControllers)
        }
    }
    
    func setupPreviousButton(btn: UIButton) {
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        btn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 15).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 29.5).isActive = true
        btn.setBackgroundImageForButton(urlImg: "btnBackLarge", btnNamed: btn)
        btn.contentMode = .scaleToFill
        btn.rx.tap
            .subscribe(){_ in
                self.popViewControler()
            }
            .disposed(by: disposeBag)
    }
    
    func setCategoriesButton(btn: UIButton) {
        btn.rx.tap
            .subscribe(){_ in
                self.onSlideMenuButtonPressed()
            }
            .disposed(by: disposeBag)
    }
    
    func popViewControler() {
        self.navigationController?.popViewController(animated: true)
    }
}
