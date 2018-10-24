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
        named.sizeToFit()
        named.text = title
        named.numberOfLines = 0
        named.lineBreakMode = NSLineBreakMode.byWordWrapping
        let fontSizeRightBar = named.font.pointSize
        named.textColor = UIColor.FlatColor.mainTitle
        named.font = UIFont(name: "Lekton-Bold", size: fontSizeRightBar)
    }
    
    func formatTextMainLabelLargeTitle(named: UILabel, title: String) {
        named.sizeToFit()
        named.text = title
        named.numberOfLines = 0
        named.lineBreakMode = NSLineBreakMode.byWordWrapping
        let fontSizeRightBar = named.font.lineHeight
        named.textColor = UIColor.FlatColor.mainTitle
        named.font = UIFont(name: "Lekton-Bold", size: fontSizeRightBar)
    }
    
    func testTitle(named: UILabel, title: String){
        named.sizeToFit()
        named.text = title
        named.numberOfLines = 0
        named.lineBreakMode = NSLineBreakMode.byWordWrapping
        let fontSizeRightBar = named.font.pointSize
        named.textColor = UIColor.FlatColor.mainTitle
        named.font = UIFont(name: "Lekton-Bold", size: fontSizeRightBar)
    }
    
    func formatTextLabelRightBar(named: UILabel, title: String) {
        named.sizeToFit()
        named.text = title
        named.numberOfLines = 0
        named.textAlignment  = .center
        named.lineBreakMode = NSLineBreakMode.byWordWrapping
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor.FlatColor.mainTitle
        let fontSize = named.font.pointSize
        named.font = UIFont(name: "Lekton-Bold", size: fontSize)
    }
    
    func formatTextLableContent(named: UILabel) {
        named.sizeToFit()
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor.FlatColor.mainTitle
        let fontSize = named.font.pointSize
        named.font = UIFont(name: "Lekton-Regular", size: fontSize)
    }
    
    func formatTextLableButton(named: UILabel, title: Int) {
        named.sizeToFit()
        named.text = String("$" + String(title))
        named.textAlignment = .center
        named.adjustsFontSizeToFitWidth = true
        named.textColor = UIColor.FlatColor.mainTitle
        let fontSize = 25
        named.font = UIFont(name: "Lekton-Regular", size: CGFloat(fontSize))
    }
    
    func formatMenuTitleLabel(named: UILabel){
        named.contentMode = .scaleAspectFit
        let fontSizeRightBar = named.font.pointSize
        named.font = UIFont(name: "Charter-Bold", size: fontSizeRightBar)
    }
    
    func drawLineView(label: UILabel, view: UIView){
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.001).isActive = true
        label.backgroundColor = UIColor.FlatColor.mainTitle
    }
    
}

extension UITextView {
    func formatTextViewContent(named: UITextView, title: String) {
        named.text = title
        named.textColor = UIColor.FlatColor.mainTitle
        named.textContainerInset = UIEdgeInsets.zero
        named.textContainer.lineFragmentPadding = 0
        named.isScrollEnabled = false
        named.showsVerticalScrollIndicator = false
        named.showsHorizontalScrollIndicator = false
        named.textContainer.maximumNumberOfLines = 6
        named.textContainer.lineBreakMode = .byTruncatingTail
        
        guard let fontSize = named.font?.lineHeight else {
            return
        }
        named.font = UIFont(name: "Dosis-Medium", size: fontSize)
    }
}
