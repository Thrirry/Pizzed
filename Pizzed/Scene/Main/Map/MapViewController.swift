//
//  MapViewController.swift
//  Pizzed
//
//  Created by Gone on 10/8/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class MapViewController: BaseViewController {

    // MARK: - Compulsory ones
    static func viewController() -> MapViewController? {
        return Helper.getViewController(named: "MapViewController", inSb: "Main")
    }
    var viewModel: MapViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        view.backgroundColor = .white
        setupIUs()
    }
    
    func setupIUs() {
        
        let label = UILabel()
        label.text = "Hello, new map controller"
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        let previousBtn = UIButton()
        
        view.addSubview(previousBtn)
        
        setupPreviousButton(btn: previousBtn)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}
