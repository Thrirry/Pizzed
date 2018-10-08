//
//  TextField.swift
//  ServicePlatform
//
//

import RxCocoa

public extension UITextField {

  /// Changing self placeholder font by inputting font
  ///
  /// - Parameter font: Font that placeholder need to be changed to
  public func changePlaceholder(color: UIColor, font: UIFont) {
    let attributes = [NSAttributedStringKey.foregroundColor: color,
                      NSAttributedStringKey.font: font]
    attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
  }

  /// Convenient function for making a Rx driver of textfield
  ///
  /// - Returns: Rx driver
  public func driver() -> Driver<String> {
    return rx.text.orEmpty.asDriver()
  }

  public func value() -> Driver<String> {
    let f = rx.observe(String.self, "text").map({ $0 ?? "" }).asDriver("")
    return Driver.merge(driver(), f).distinctUntilChanged()
  }
}
