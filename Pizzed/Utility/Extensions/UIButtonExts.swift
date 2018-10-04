//
//  UIButtonExts.swift
//  Pizzed
//
//  Created by Gone on 10/4/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setBackgroundImageForButton(urlImg: String, btnNamed: UIButton){
        guard let url = UIImage(named: urlImg) else {
            return
        }
        btnNamed.setBackgroundImage(url, for: .normal)
    }
}
