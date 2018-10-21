//
//  NutritionalTableViewCell.swift
//  Pizzed
//
//  Created by Gone on 10/11/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NutriInfoTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label: UILabel = {
        let label = UILabel()
//        label.text = "Calories ...................300 kcal"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.formatTextLableContent(named: label)
        return label
    }()
    
    func displayNutri(info: String) {
        label.text = info
    }
    
    func setUpViews() {
        addSubview(label)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": label]))
    }
}
