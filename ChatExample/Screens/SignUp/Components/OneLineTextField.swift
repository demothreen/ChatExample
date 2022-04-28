//
//  OneLineTextField.swift
//  ChatExample
//
//  Created by demothreen on 28.04.2022.
//

import UIKit

class OneLineTextField: UITextField {
  convenience init(fontSize: CGFloat = 14) {
    self.init()

    self.font = UIFont.systemFont(ofSize: fontSize)
    self.borderStyle = .none
    let bottomLine = UIView(frame: .zero)
    bottomLine.backgroundColor = .lightGray
    self.addSubview(bottomLine)
    bottomLine.snp.makeConstraints { make in
      make.bottom.left.right.equalToSuperview()
      make.height.equalTo(1)
    }
  }
}
