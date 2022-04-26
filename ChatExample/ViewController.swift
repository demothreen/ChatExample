//
//  ViewController.swift
//  ChatExample
//
//  Created by demothreen on 26.04.2022.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red.withAlphaComponent(0.3)
  }


}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
  static var previews: some View {
    ContainerView().edgesIgnoringSafeArea(.all)
  }

  struct ContainerView: UIViewControllerRepresentable {
    let viewController = ViewController()
    func makeUIViewController(context: Context) -> some UIViewController {
      return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
  }
}
