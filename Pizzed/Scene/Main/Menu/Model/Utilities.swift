//
//  Utilities.swift
//  Pizzed
//
//  Created by Gone on 10/7/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

final class Utilities {
    
    static func createData() -> [SuperStar] {
        let ronaldo = SuperStar(name: "Cristiano Ronaldo")
        let messi = SuperStar(name: "Leonel Messi")
        let torres = SuperStar(name: "Fernando Torres")
        return [ronaldo, messi, torres]
    }
}
