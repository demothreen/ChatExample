//
//  ViewController.swift
//  ChatExample
//
//  Created by demothreen on 26.04.2022.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
  private let logoImageView = UIImageView(image: UIImage(named: "chatLogo"), contentMode: .scaleAspectFit)
  private let googleButton = UIButton(title: "Google", backgroundColor: .white, titleColor: .black, isShadow: true, fontSize: 20)
  private let emailButton = UIButton(title: "Email", backgroundColor: .black, titleColor: .white, isShadow: false, fontSize: 20)
  private let loginButton = UIButton(title: "Login", backgroundColor: .white, titleColor: .red, isShadow: true, fontSize: 20)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupContraints()
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

    let stackView = UIStackView(arrSubviews: [googleFormView, emailFormView, loginFormView], axis: .vertical, spacing: 40)
    view.addSubview(stackView)
    stackView.snp.makeConstraints { make in
      make.top.equalTo(logoImageView.snp.bottom).inset(-80)
      make.left.right.equalToSuperview().inset(20)
    }
  }
}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
  static var previews: some View {
    ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portraitUpsideDown)
  }

  struct ContainerView: UIViewControllerRepresentable {
    let viewController = AuthViewController()
    func makeUIViewController(context: Context) -> AuthViewController {
      return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
  }
}
