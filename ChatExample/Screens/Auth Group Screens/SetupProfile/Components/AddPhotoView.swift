//
//  AddPhotoView.swift
//  ChatExample
//
//  Created by demothreen on 30.04.2022.
//

import UIKit

class AddPhotoView: UIView {
  var circleImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "profile")
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  let plusButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "plus"), for: .normal)
    button.tintColor = .black
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubview(circleImageView)
    addSubview(plusButton)
    setupUI()
  }

  private func setupUI() {
    circleImageView.snp.makeConstraints { make in
      make.top.left.equalToSuperview()
      make.height.width.equalTo(100)
      make.bottom.equalToSuperview()
    }

    plusButton.snp.makeConstraints { make in
      make.left.equalTo(circleImageView.snp.right).inset(-16)
      make.centerY.equalTo(circleImageView)
      make.height.width.equalTo(30)
      make.right.equalToSuperview()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
