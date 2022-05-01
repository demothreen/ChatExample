//
//  SetupProfileVC.swift
//  ChatExample
//
//  Created by demothreen on 30.04.2022.
//

import UIKit

class SetupProfileVC: BaseVC {
  let welcomeLabel = UILabel(text: "Set up profile!", fontSize: 26)
  let fullImageView = AddPhotoView()
  let fullNameLabel = UILabel(text: "Full name")
  let aboutmeLabel = UILabel(text: "About me")
  let sexLabel = UILabel(text: "Sex")
  let fullNameTextField = OneLineTextField(fontSize: 20)
  let aboutMeTextField = OneLineTextField(fontSize: 20)
  let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
  let goToChatsButton = UIButton(title: "Go to chats!", backgroundColor: .black, titleColor: .white)

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    let fullNameStackView = UIStackView(arrSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
    let aboutMeStackView = UIStackView(arrSubviews: [aboutmeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
    let sexStackView = UIStackView(arrSubviews: [sexLabel, sexSegmentedControl], axis: .vertical, spacing: 12)

    goToChatsButton.snp.makeConstraints {$0.height.equalTo(50)}
    let stackView = UIStackView(arrSubviews: [fullNameStackView, aboutMeStackView, sexStackView, goToChatsButton], axis: .vertical, spacing: 30)

    view.addSubview(welcomeLabel)
    view.addSubview(fullImageView)
    view.addSubview(stackView)

    welcomeLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(80)
      make.centerX.equalToSuperview()
    }

    fullImageView.snp.makeConstraints { make in
      make.top.equalTo(welcomeLabel.snp.bottom).inset(-40)
      make.centerX.equalToSuperview()
    }

    stackView.snp.makeConstraints { make in
      make.top.equalTo(fullImageView.snp.bottom).inset(-40)
      make.left.right.equalToSuperview().inset(40)
    }
  }
}
