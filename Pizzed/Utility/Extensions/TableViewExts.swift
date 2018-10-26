//
//  TableViewExts.swift
//  Pizzed
//
//  Created by Gone on 10/24/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import Foundation

#if os(iOS)
import UIKit
// swiftlint:disable force_cast
extension UITableView {
    func dequeueCell<T>(ofType type: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self)) as! T
    }
}
// swiftlint:disable force_cast
#elseif os(OSX)
import Cocoa

extension NSTableView {
    func dequeueCell<T>(ofType type: T.Type) -> T {
        return make(withIdentifier: String(describing: T.self), owner: self) as! T
    }
}

#endif
