//
//  LoginVC.swift
//  ChatExample
//
//  Created by demothreen on 30.04.2022.
//

import UIKit

class LoginVC: BaseVC {
  let welcomeLabel = UILabel(text: "Welcome back!")
  let loginWithLabel = UILabel(text: "Login with")
  let orLabel = UILabel(text: "or")
  let emailLabel = UILabel(text: "Email")
  let passwordLabel = UILabel(text: "Password")
  let needAnAccountLabel = UILabel(text: "Need an account?")

  let googleButton = UIButton(title: "Google", backgroundColor: .white, titleColor: .black, isShadow: true)
  let emailTextField = OneLineTextField(fontSize: 20)
  let passwordTextField = OneLineTextField(fontSize: 20)
  let loginButton = UIButton(title: "Login", backgroundColor: .black, titleColor: .white)
  let signInButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.setTitleColor(.red, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupConstraints()
  }

  private func setupConstraints() {
    let loginWithView = ButtonFormView(label: loginWithLabel, btn: googleButton)
    let emailStackView = UIStackView(arrSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
    let passwordStackView = UIStackView(arrSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
    loginButton.snp.makeConstraints { $0.height.equalTo(50) }
    let stackView = UIStackView(
      arrSubviews: [
        loginWithView,
        orLabel,
        emailStackView,
        passwordStackView,
        loginButton
      ],
      axis: .vertical,
      spacing: 20)

    signInButton.contentHorizontalAlignment = .leading
    let bottomStackView = UIStackView(arrSubviews: [needAnAccountLabel, signInButton], axis: .horizontal, spacing: 10)
    bottomStackView.alignment = .firstBaseline

    stackView.translatesAutoresizingMaskIntoConstraints = false
    bottomStackView.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(welcomeLabel)
    view.addSubview(stackView)
    view.addSubview(bottomStackView)

    welcomeLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(80)
      make.centerX.equalToSuperview()
    }

    stackView.snp.makeConstraints { make in
      make.top.equalTo(welcomeLabel.snp.bottom).inset(-40)
      make.left.right.equalToSuperview().inset(40)
    }

    bottomStackView.snp.makeConstraints { make in
      make.top.equalTo(stackView.snp.bottom).inset(-60)
      make.left.right.equalToSuperview().inset(40)
    }
  }
}
