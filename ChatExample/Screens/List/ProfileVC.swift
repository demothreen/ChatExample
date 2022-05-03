//
//  ProfileVC.swift
//  ChatExample
//
//  Created by demothreen on 03.05.2022.
//

import UIKit

class ProfileVC: UIViewController {
  let containerView = UIView()
  let imageView = UIImageView(image: #imageLiteral(resourceName: "human2"), contentMode: .scaleAspectFill)
  let nameLabel = UILabel(text: "Peter Ben", fontSize: 20)
  let aboutMeLabel = UILabel(text: "You have the opportunity to chat with the best man in the world!", fontSize: 16)
  let myTextField = InsertableTextField()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    constomizeElements()
    setupUI()
  }

  private func constomizeElements() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    containerView.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
    myTextField.translatesAutoresizingMaskIntoConstraints = false
    aboutMeLabel.numberOfLines = 0
    containerView.backgroundColor = .mainWhite
    containerView.layer.cornerRadius = 30

    if let button = myTextField.rightView as? UIButton {
      button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    }
  }

  @objc private func sendMessage() {
    print(#function)
  }

  private func setupUI() {
    view.addSubview(imageView)
    view.addSubview(containerView)
    containerView.addSubview(nameLabel)
    containerView.addSubview(aboutMeLabel)
    containerView.addSubview(myTextField)

    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: view.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30)
    ])

    NSLayoutConstraint.activate([
      containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      containerView.heightAnchor.constraint(equalToConstant: 206)
    ])

    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
      nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
      nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
    ])

    NSLayoutConstraint.activate([
      aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
      aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
      aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
    ])

    NSLayoutConstraint.activate([
      myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
      myTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
      myTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
      myTextField.heightAnchor.constraint(equalToConstant: 48)
    ])
  }
}
