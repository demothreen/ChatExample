//
//  WaitingChatCell.swift
//  ChatExample
//
//  Created by demothreen on 03.05.2022.
//

import UIKit

class WaitingChatCell: UICollectionViewCell, ConfiguringCell {
  private let friendImageView = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .yellow

    self.layer.cornerRadius = 4
    self.clipsToBounds = true
    setupUI()
  }

  func configure(with value: MChat) {
    friendImageView.image = UIImage(named: value.userImageString)
  }

  private func setupUI() {
    addSubview(friendImageView)
    friendImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
