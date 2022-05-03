//
//  ViewController.swift
//  ChatExample
//
//  Created by demothreen on 26.04.2022.
//

import UIKit
import SnapKit

class AuthVC: BaseVC {
  private let logoImageView = UIImageView(image: UIImage(named: "chatLogo"), contentMode: .scaleAspectFit)
  private let googleButton = UIButton(title: "Google", backgroundColor: .white, titleColor: .black, isShadow: true)
  private let emailButton = UIButton(title: "Email", backgroundColor: .black, titleColor: .white)
  private let loginButton = UIButton(title: "Login", backgroundColor: .white, titleColor: .red, isShadow: true)

  override func viewDidLoad() {
    super.viewDidLoad()
    setupContraints()

    googleButton.addTarget(self, action: #selector(googleButtonPress), for: .touchUpInside)
    emailButton.addTarget(self, action: #selector(emailButtonPress), for: .touchUpInside)
    loginButton.addTarget(self, action: #selector(loginButtonPress), for: .touchUpInside)
  }

  @objc private func googleButtonPress() {
    print(#function)
  }

  @objc private func emailButtonPress() {
    present(SignUpVC(), animated: true)
  }

  @objc private func loginButtonPress() {
    present(LoginVC(), animated: true)
  }

  private func setupContraints() {
    view.addSubview(logoImageView)
    logoImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(80)
      make.centerX.equalToSuperview()
    }

    let googleFormView = ButtonFormView(label: UILabel(text: "Get started with"), btn: googleButton)
    let emailFormView = ButtonFormView(label: UILabel(text: "Or sign up with"), btn: emailButton)
    let loginFormView = ButtonFormView(label: UILabel(text: "Already onboard?"), btn: loginButton)

    let stackView = UIStackView(arrSubviews: [googleFormView, emailFormView, loginFormView], axis: .vertical, spacing: 30)
    view.addSubview(stackView)
    stackView.snp.makeConstraints { make in
      make.top.equalTo(logoImageView.snp.bottom).inset(-80)
      make.left.right.equalToSuperview().inset(20)
    }
  }
}
