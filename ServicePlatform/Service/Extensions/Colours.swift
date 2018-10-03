//
//  Colours.swift
//  Pizzed
//
//  Created by Gone on 8/14/18.
//  Copyright © 2018 Gone. All rights reserved.
//
import UIKit

extension UIColor {
    struct FlatColor {
        struct Background {
            static let HomeBackground = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.0)
            static let ItemsBackground = UIColor(red: 0.73, green: 0.89, blue: 0.79, alpha: 0.2)
            static let RightBarBackground = UIColor(red: 0.99, green: 0.33, blue: 0.14, alpha: 1.0)
            static let ItemDetailBackground = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 0.4)
            static let ProductDetailBackground = UIColor(red: 0.73, green: 0.89, blue: 0.79, alpha: 0.5)
        }
        struct ItemProduct {
            static let ImageView = UIColor(red: 0.99, green: 0.33, blue: 0.14, alpha: 1.0)
            static let BackgroundImage = UIColor(red: 0.73, green: 0.89, blue: 0.79, alpha: 1.0)
            static let BackgroundContent = UIColor(red: 0.73, green: 0.89, blue: 0.79, alpha: 0.2)
            static let orderButton = UIColor(red: 0.73, green: 0.89, blue: 0.79, alpha: 1.0)
            static let borderOrderButton = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        }
        struct Menu {
          static let green = UIColor(red: 0.99, green: 0.33, blue: 0.14, alpha: 1.0)
        }
    }
}
