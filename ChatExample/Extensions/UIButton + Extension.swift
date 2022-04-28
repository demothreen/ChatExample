//
//  UIButton + Extension.swift
//  ChatExample
//
//  Created by demothreen on 27.04.2022.
//

import UIKit

extension UIButton {
  convenience init(title: String, backgroundColor: UIColor, titleColor: UIColor, isShadow: Bool = false, fontSize: CGFloat = 20) {
    self.init(type: .system)
    self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
    self.setTitle(title, for: .normal)
    self.setTitleColor(titleColor, for: .normal)
    self.backgroundColor = backgroundColor
    layer.cornerRadius = 4
    if isShadow {
      self.layer.shadowColor = UIColor.black.cgColor
      self.layer.shadowRadius = 4
      self.layer.shadowOpacity = 0.2
      self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
  }
}
