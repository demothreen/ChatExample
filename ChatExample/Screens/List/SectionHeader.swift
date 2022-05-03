//
//  SectionHeader.swift
//  ChatExample
//
//  Created by demothreen on 03.05.2022.
//

import UIKit

class SectionHeader: UICollectionReusableView {
  static let reuseId = "SectionHeader"
  private let title = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(title)
    title.snp.makeConstraints { $0.edges.equalToSuperview() }
  }

  func configure(text: String, fontSize: CGFloat, textColor: UIColor) {
    title.textColor = textColor
    title.font = UIFont.systemFont(ofSize: fontSize)
    title.text = text
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
