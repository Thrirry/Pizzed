//
//  Helper.swift
//  Pizzed
//
//  Created by Gone on 8/13/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

struct Helper {
    
    static func getViewController<T: UIViewController>(named: String, inSb sbNamed: String) -> T? {
        return UIStoryboard(name: sbNamed, bundle: nil).instantiateViewController(withIdentifier: named) as? T
    }
}
