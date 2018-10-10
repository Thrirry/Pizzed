//
//  TestViewController.swift
//  Pizzed
//
//  Created by Gone on 10/8/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Hello, new view controller"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }

}
