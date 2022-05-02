//
//  ActiveChatCell.swift
//  ChatExample
//
//  Created by demothreen on 03.05.2022.
//

import UIKit

protocol ConfiguringCell {
  static var reuseId: String { get }
  func configure(with value: MChat)
}

class ActiveChatCell: UICollectionViewCell, ConfiguringCell {
  static var reuseId: String = "ActiveChatCell"
  let friendImageView = UIImageView()
  let friendName = UILabel(text: "User name", fontSize: 20)
  let lastMessage = UILabel(text: "How are you?", fontSize: 18)
  let gradientView = UIView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    setupUI()

    self.layer.cornerRadius = 4
    self.clipsToBounds = true
  }

  func configure(with value: MChat) {
    friendImageView.image = UIImage(named: value.userImageString)
    friendName.text = value.username
    lastMessage.text = value.lastMessage
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    friendImageView.backgroundColor = .orange
    gradientView.backgroundColor = .black

    addSubview(friendImageView)
    addSubview(gradientView)
    addSubview(friendName)
    addSubview(lastMessage)

    friendImageView.snp.makeConstraints { make in
      make.left.equalToSuperview()
      make.centerY.equalToSuperview()
      make.height.width.equalTo(78)
    }

    friendName.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(12)
      make.left.equalTo(friendImageView.snp.right).inset(-16)
      make.right.equalTo(gradientView.snp.left).inset(16)
    }

    lastMessage.snp.makeConstraints { make in
      make.bottom.equalToSuperview().inset(12)
      make.left.equalTo(friendImageView.snp.right).inset(-16)
      make.right.equalTo(gradientView.snp.left).inset(16)
    }

    gradientView.snp.makeConstraints { make in
      make.right.equalToSuperview()
      make.centerY.equalToSuperview()
      make.height.equalTo(78)
      make.width.equalTo(8)
    }
  }
}
