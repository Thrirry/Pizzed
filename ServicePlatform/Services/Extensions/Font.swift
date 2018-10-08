//
//  Font.swift
//  ServicePlatform
//
//

import UIKit

public extension UIFont {

  public func sizeOfString (string: String, lineHeight: CGFloat = 24.0, constrainedToWidth width: CGFloat) -> CGSize {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.minimumLineHeight = lineHeight
    paragraphStyle.maximumLineHeight = lineHeight

    let attributes = [NSAttributedStringKey.font: self]
    let attString = NSMutableAttributedString(string: string,attributes: attributes)
    attString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, (string as NSString).length))
    let framesetter = CTFramesetterCreateWithAttributedString(attString)
    return CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(location: 0,length: 0), nil, CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), nil)
  }

  public func width(text: String) -> CGFloat {
    return ceil((text as NSString).size(withAttributes: [NSAttributedStringKey.font: self]).width)
  }
}