//
//  StoryboardExts.swift
//  Pizzed
//
//  Created by Gone on 10/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

#if os(iOS)
import UIKit

// swiftlint:disable force_cast
extension UIStoryboard {
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}
#elseif os(OSX)
import Cocoa

// swiftlint:disable force_cast
extension NSStoryboard {
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        return instantiateController(withIdentifier: String(describing: type)) as! T
    }
}
#endif
