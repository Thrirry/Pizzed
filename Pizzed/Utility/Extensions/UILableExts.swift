//
//  UILableExts.swift
//  Pizzed
//
//  Created by Gone on 9/11/18.
//  Copyright © 2018 Gone. All rights reserved.
//

import UIKit

extension UILabel {
    func formatTextMainLabelTitle(named: UILabel, title: String) {
        named.text = title
        named.numberOfLines = 0
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        let fontSize = named.font.lineHeight
        named.font = UIFont(name: "Lekton-Bold", size: fontSize)
    }
    func formatTextLabelTitle(named: UILabel, title: String) {
        named.text = title
        named.numberOfLines = 0
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        let fontSize = named.font.pointSize
        named.font = UIFont(name: "Lekton-Bold", size: fontSize)
    }
    func formatTextLableContent(named: UILabel) {
        named.sizeToFit()
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        let fontSize = named.font.pointSize
        named.font = UIFont(name: "Lekton-Regular", size: fontSize)
    }
    func formatTextLableButton(named: UILabel, title: String) {
        named.sizeToFit()
        named.text = title
        named.textAlignment = .center
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        let fontSize = 25
        named.font = UIFont(name: "Lekton-Regular", size: CGFloat(fontSize))
    }
}

extension UITextView {
    func formatTextViewContent(named: UITextView) {
        named.textColor = UIColor(red: 0.21, green: 0.41, blue: 0.35, alpha: 1.0)
        named.adjustsFontForContentSizeCategory = true
        named.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let fontSize = (named.font?.lineHeight)! + 0.01
        named.font = UIFont(name: "Lekton-Regular", size: fontSize)
    }
}
