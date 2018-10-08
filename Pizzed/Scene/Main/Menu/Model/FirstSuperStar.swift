//
//  FirstSuperStar.swift
//  Pizzed
//
//  Created by Gone on 10/7/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class FirstSuperStar: NSObject {

    let superStars = Variable<[SuperStar]>([])
//    let superStars: Variable<[SuperStar]> = Variable([])
    
    override init() {
        superStars.value = Utilities.createData()
    }
}
