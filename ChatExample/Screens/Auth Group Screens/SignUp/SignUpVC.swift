//
//  SignUpVC.swift
//  ChatExample
//
//  Created by demothreen on 27.04.2022.
//

import UIKit

class SignUpVC: BaseVC {
  let welcomeLabel = UILabel(text: "Welcome!", fontSize: 26)
  let emailLabel = UILabel(text: "Email")
  let passwordLabel = UILabel(text: "Password")
  let confirmPasswordLabel = UILabel(text: "Confirm password")
  let alreadyLabel = UILabel(text: "Already onboard?")

  let signUpBtn = UIButton(title: "Sign up", backgroundColor: .black, titleColor: .white)
  let loginBtn = UIButton()
  let emailTextField = OneLineTextField(fontSize: 20)
  let passwordTextField = OneLineTextField(fontSize: 20)
  let confirmTextField = OneLineTextField(fontSize: 20)

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()

    signUpBtn.addTarget(self, action: #selector(signUpBtnPress), for: .touchUpInside)
  }

  @objc private func signUpBtnPress() {
    AuthService.shared.register(
      email: emailTextField.text,
      password: passwordTextField.text,
      confirmPassword: confirmTextField.text) { (result) in
        switch result {
        case .success(let user):
          self.showAlert(with: "Успешно!", and: "Вы зарегистрированны!")
        case .failure(let error):
          self.showAlert(with: "Ошибка!", and: error.localizedDescription)
        }
      }
  }

  private func setupUI() {
    let emailStackView = UIStackView(arrSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
    let passwordStackView = UIStackView(arrSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
    let confirmStackView = UIStackView(arrSubviews: [confirmPasswordLabel, confirmTextField], axis: .vertical, spacing: 0)
    loginBtn.setTitle("Login", for: .normal)
    loginBtn.setTitleColor(.red, for: .normal)

    let stackView = UIStackView(arrSubviews: [emailStackView, passwordStackView, confirmStackView, signUpBtn], axis: .vertical, spacing: 30)
    signUpBtn.snp.makeConstraints { make in
      make.height.equalTo(40)
    }
    let bottomStackView = UIStackView(arrSubviews: [alreadyLabel, loginBtn], axis: .horizontal, spacing: -1)

    view.addSubview(welcomeLabel)
    view.addSubview(stackView)
    view.addSubview(bottomStackView)

    welcomeLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(80)
      make.centerX.equalToSuperview()
    }
    stackView.snp.makeConstraints { make in
      make.top.equalTo(welcomeLabel.snp.bottom).inset(-80)
      make.left.right.equalToSuperview().inset(20)
    }

    bottomStackView.snp.makeConstraints { make in
      make.top.equalTo(stackView.snp.bottom).inset(-80)
      make.left.right.equalToSuperview().inset(20)
    }
  }
}
