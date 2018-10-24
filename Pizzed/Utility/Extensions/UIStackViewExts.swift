//
//  UIStackView.swift
//  Pizzed
//
//  Created by Gone on 9/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import Foundation

extension UIStackView {
    
    func changeBackgroundColours(color: UIColor) {
        let backgroundLayer = CAShapeLayer()
        self.layer.insertSublayer(backgroundLayer, at: 0)
        backgroundLayer.path = UIBezierPath(rect: self.bounds).cgPath
        backgroundLayer.fillColor = color.cgColor
    }    
}
