//
//  StackView + Extension.swift
//  ChatExample
//
//  Created by demothreen on 27.04.2022.
//

import UIKit

extension UIStackView {
  convenience init(arrSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
    self.init(arrangedSubviews: arrSubviews)

    self.axis = axis
    self.spacing = spacing
  }
}
