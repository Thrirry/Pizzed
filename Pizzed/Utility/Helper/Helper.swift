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
    
    static func showLoading() {
        let screenSize = UIScreen.main.bounds.size
        let widthInd: CGFloat = 36
        let frame = CGRect(x: screenSize.width/2 - widthInd/2, y: screenSize.height/2 - widthInd/2, width: widthInd, height: widthInd)
        let indicator = UIActivityIndicatorView(frame: frame)
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.color = .red
        indicator.startAnimating()
        UIApplication.shared.keyWindow?.addSubview(indicator)
        
    }
    
    static func hideLoading() {
        let indicator = UIApplication.shared.keyWindow?.subviews.filter({ $0 is UIActivityIndicatorView}).first as? UIActivityIndicatorView
        indicator?.removeFromSuperview()
    }
}
