//
//  ButtonFormView.swift
//  ChatExample
//
//  Created by demothreen on 27.04.2022.
//

import UIKit

class ButtonFormView: UIView {
  init(label: UILabel, btn: UIButton) {
    super.init(frame: .zero)

    self.addSubview(label)
    self.addSubview(btn)

    label.snp.makeConstraints { $0.top.leading.equalToSuperview() }
    btn.snp.makeConstraints { make in
      make.top.equalTo(label.snp.bottom).inset(-10)
      make.left.right.equalToSuperview()
      make.height.equalTo(40)
      make.bottom.equalToSuperview()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
