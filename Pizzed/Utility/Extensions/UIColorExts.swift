//
//  UIColor.swift
//  Pizzed
//
//  Created by Gone on 10/7/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    struct FlatColor {
        
        static let mainBackground = UIColor(rgb: 0xFFFBE6)
        static let mainTitle = UIColor(rgb: 0x356859)
        
        struct Product {
            static let background = UIColor(rgb: 0xB9E4C9)
            static let orderButton = UIColor(rgb: 0x538891)
            static let borderButton = UIColor(rgb: 0x538891)
        }
        
        struct Item {
            static let background = UIColor(rgb: 0xFFFBE6)
            static let orderButton = UIColor(rgb: 0xB9E4C9)
            static let borderButton = UIColor(rgb: 0x538891)
            static let backgroundImage = UIColor(rgb: 0xB9E4C9)
        }
        
        struct Menu {
            static let green = UIColor(red: 0.99, green: 0.33, blue: 0.14, alpha: 1.0)
            static let background = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.0)
            static let hover = UIColor(red: 0.99, green: 0.98, blue: 0.92, alpha: 1.0)
            static let notificationBackground = UIColor(red: 0.99, green:0.33, blue: 0.14, alpha: 0.85)
        }
     
        struct RightBar {
            static let background = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.0)
        }
    }
    
    struct Button {
        struct previousButton {
            static let color = UIColor(red: 0.33, green: 0.53, blue: 0.57, alpha: 1.0)
        }
    }
}
