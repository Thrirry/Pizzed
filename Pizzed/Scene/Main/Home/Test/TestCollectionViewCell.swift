//
//  TestCollectionViewCell.swift
//  Pizzed
//
//  Created by Gone on 10/20/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var pizza: PizzaDetail! {
        didSet{
            guard let pizza = pizza else {return}
            titleLabel.formatTextMainLabelLargeTitle(named: titleLabel, title: pizza.composition ?? "")
            
            print("heyyyy \(String(describing: pizza.composition))")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
