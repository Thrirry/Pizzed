//
//  LaunchViewController.swift
//  Pizzed
//
//  Created by Gone on 8/14/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var pizzaCutterProgress: UIProgressView!
    @IBOutlet weak var pizzaCutterImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.brown
        setUpLayout()
        updateProgressView()
        transformCutterImage()
        transformLogoImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func updateProgressView() {
        UIView.animate(withDuration: 3.3, animations: { () -> Void in
            self.pizzaCutterProgress.setProgress(1.0, animated: true)
        })
        self.pizzaCutterProgress.trackTintColor = UIColor.clear
        self.pizzaCutterProgress.progressTintColor = UIColor(red: 0.99, green: 0.33, blue: 0.14, alpha: 1.0)
        self.pizzaCutterProgress.backgroundColor = UIColor(red: 0.99, green: 0.33, blue: 0.14, alpha: 0.3)
    }
    func transformCutterImage() {
        UIView.animate(withDuration: 3.3, animations: { () -> Void in
            let translate = CGAffineTransform(translationX: self.pizzaCutterProgress.width * 0.97, y: 0)
            self.pizzaCutterImage.transform = translate
        }, completion: {(_) -> Void in
            
//            (UIApplication.shared.delegate as! AppDelegate).redirect()
            (UIApplication.shared.delegate as? AppDelegate)?.redirect()
})
    }
    func transformLogoImage() {
        UIView.animate(withDuration: 3.3, animations: { () -> Void in
            self.logoImageView.frame.size.width += 20
            self.logoImageView.frame.size.height += 20
        }, completion: nil)
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.logoImageView.contentMode = .scaleAspectFit
        self.logoImageView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        self.logoImageView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        self.logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        self.logoImageView.image = UIImage(named: "mainLogo")
    }
    func setUpLayout() {
        view.backgroundColor = UIColor.FlatColor.Background.HomeBackground
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Launch")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFit
        self.view.insertSubview(backgroundImage, at: 0)
        view.addSubview(pizzaCutterProgress)
        view.addSubview(pizzaCutterImage)
        pizzaCutterProgress.translatesAutoresizingMaskIntoConstraints = false
        pizzaCutterProgress.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        pizzaCutterProgress.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.008).isActive = true
        pizzaCutterProgress.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        pizzaCutterProgress.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pizzaCutterProgress.layer.cornerRadius = 3
        pizzaCutterProgress.clipsToBounds = true
        pizzaCutterProgress.layer.sublayers![1].cornerRadius = 3
        pizzaCutterProgress.subviews[1].clipsToBounds = true
        pizzaCutterImage.translatesAutoresizingMaskIntoConstraints = false
        pizzaCutterImage.image = UIImage(named: "btnPizzaCutterActive")
        pizzaCutterImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pizzaCutterImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        pizzaCutterImage.bottomAnchor.constraint(equalTo: pizzaCutterProgress.topAnchor, constant: -1).isActive = true
        pizzaCutterImage.leftAnchor.constraint(equalTo: pizzaCutterProgress.leftAnchor).isActive = true
    }
}
