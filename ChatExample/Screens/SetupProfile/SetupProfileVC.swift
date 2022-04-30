//
//  SetupProfileVC.swift
//  ChatExample
//
//  Created by demothreen on 30.04.2022.
//

import UIKit

class SetupProfileVC: UIViewController {
  let fillImageView = AddPhotoView()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    setupConstraints()
  }

  private func setupConstraints() {
    view.addSubview(fillImageView)

    fillImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(80)
      make.centerX.equalToSuperview()
    }
  }
}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
  static var previews: some View {
    ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portraitUpsideDown)
  }

  struct ContainerView: UIViewControllerRepresentable {
    let viewController = SetupProfileVC()
    func makeUIViewController(context: Context) -> UIViewController {
      return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
  }
}
