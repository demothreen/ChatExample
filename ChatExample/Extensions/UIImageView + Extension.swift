//
//  UIImageView + Extension.swift
//  ChatExample
//
//  Created by demothreen on 27.04.2022.
//

import UIKit

extension UIImageView {
  convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
    self.init()

    self.image = image
    self.contentMode = contentMode
  }
}

