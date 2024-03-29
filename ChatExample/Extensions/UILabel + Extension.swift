//
//  UILabel + Extension.swift
//  ChatExample
//
//  Created by demothreen on 27.04.2022.
//

import UIKit

extension UILabel {
  convenience init(text: String, fontSize: CGFloat = 20) {
    self.init()
    self.text = text
    self.textColor = .black
    self.font = UIFont.systemFont(ofSize: fontSize)
  }
}
