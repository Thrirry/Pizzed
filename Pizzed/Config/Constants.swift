//
//  Constants.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Types {
    }
    
    // MARK: - Resoure Images constants
    struct CResourceImage {
        static let PizzaWorld = "mainLogo"
        static let Cart = "btnCart"
        static let Map = "btnMap"
        static let Clock = "btnClock"
        static let Telephone = "btnTelephone"
        static let Back = "btnBackLarge"
    }
}

//    func binding() {
//        arrayIconOfMenuSlide = [IconMenuSlide(cell: 0, image: #imageLiteral(resourceName: "mainLogo"), title: " "),
//                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "mainLogo"), title: "Pizza World"),
//                                IconMenuSlide(cell: 1, image:, title: "Your Cart"),
//                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "map-location"), title: "Coverage Area"),
//                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "Telephone"), title: "Telephone"),
//                                IconMenuSlide(cell: 1, image: #imageLiteral(resourceName: "alarm-clock"), title: "8AM - 11PM"),
//                                IconMenuSlide(cell: 2, image: #imageLiteral(resourceName: "back-arrow-final"), title: " ") ]
//    }

// MARK: - Global defining
typealias Action = () -> Void
