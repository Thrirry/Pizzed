//
//  VCExts.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func initialButton(title: String, color: UIColor, fontSize: CGFloat = 13, width: CGFloat = 40) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: 30))
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return button
    }
    
    @discardableResult func addLeftButton(title: String = "", color: UIColor = .black, fontSize: CGFloat = 14, width: CGFloat = 40) -> UIButton {
        let leftItem = initialButton(title: title, color: color, fontSize: fontSize, width: width)
        let barItem = UIBarButtonItem(customView: leftItem)
        navigationItem.leftBarButtonItem = barItem
        return leftItem
    }
    
    @discardableResult func addRightButton(title: String = "", color: UIColor = .black, fontSize: CGFloat = 14, width: CGFloat = 40) -> UIButton {
        let rightItem = initialButton(title: title, color: color, fontSize: fontSize, width: width)
        let barItem = UIBarButtonItem(customView: rightItem)
        navigationItem.rightBarButtonItem = barItem
        return rightItem
    }
    
    func showPopup(viewController: UIViewController? = nil, title: String? = nil, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        
        /// Dismissing the current alertviewcontroller if there is the one visible on the screen
        if let presenting = self.presentingViewController as? UIAlertController {
            presenting.dismiss(animated: false, completion: nil)
        }
        let alertViewController = UIAlertController(title: title ?? "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertViewController.addAction(okAction)
        
        if let rootViewController = viewController {
            rootViewController.present(alertViewController, animated: true)
        } else {
            self.present(alertViewController, animated: true)
        }
    }
    
    func setRootController(rootName: String, inSb sb: String, animated: Bool = true) {
        /// Breaking the function of if all conditions are not met
        guard let window = UIApplication.shared.keyWindow, let rootView = window.rootViewController,
            let destView = Helper.getViewController(named: rootName, inSb: sb) else {
                return
        }
        if !animated {
            /// Set root without animation
            window.rootViewController = destView
        } else {
            /// Replacing rootViewController within an animation
            UIView.transition(from: rootView.view, to: destView.view, duration: 0.25, options: .transitionCrossDissolve) { _ in
                window.rootViewController = destView
            }
        }
    }
    
    func setRootController(viewController: UIViewController, animated: Bool = true) {
        guard let window = UIApplication.shared.keyWindow else { return }
        if animated {
//            window.replaceRoot(vc: viewController)
        } else {
            window.rootViewController = viewController
        }
        window.makeKeyAndVisible()
    }
    /// Presenting a viewcontroller from tabbar controller
    ///
    /// - Parameter viewController: destation viewcontroller
    func tabbarPresent(viewController: UIViewController) {
        guard let tabbar = tabBarController else {
            return
        }
        viewController.modalPresentationStyle = .overCurrentContext
        tabbar.present(viewController, animated: false, completion: nil)
    }
    
    func addChildVC(_ child: UIViewController) {
        addChildViewController(child)
        view.addSubview(child.view)
    }
    func removeChildVC() {
        guard parent != nil else {
            return
        }
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionReveal
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewControllerToPresent, animated: false)
    }
    
    func dismissCollectionView() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionReveal
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false)
    }

    func setupRightBarView(rightBarContainView: UIView){
        rightBarContainView.translatesAutoresizingMaskIntoConstraints = false
        
        rightBarContainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        rightBarContainView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        rightBarContainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        rightBarContainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.18).isActive = true
    }
    
    func setupItemTableView(itemOrderTableView: UITableView){
        itemOrderTableView.translatesAutoresizingMaskIntoConstraints = false
        itemOrderTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        itemOrderTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        itemOrderTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        itemOrderTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
    }
    
    func setupItemDetailsCollectionView(itemCollectionView: UICollectionView){
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        itemCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        itemCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        itemCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        itemCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        itemCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension UIWindow {
    func replaceRoot(vc: UIViewController) {
        let snapshotImgView = UIImageView(image: snapshot())
        addSubview(snapshotImgView)
        let dismissCompletion: Action = {
            self.rootViewController = vc
            self.bringSubview(toFront: snapshotImgView)
            snapshotImgView.fadeAnimation(isShow: false, completion: {
                snapshotImgView.removeFromSuperview()
            })
        }
        dismissPresentations(completed: dismissCompletion)
    }

    private func dismissPresentations(completed: @escaping Action) {
        if rootViewController?.presentedViewController != nil {
            rootViewController?.dismiss(animated: false, completion: {
                self.dismissPresentations(completed: completed)
            })
        } else {
            completed()
        }
    }
}
