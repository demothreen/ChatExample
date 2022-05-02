//
//  ListVC.swift
//  ChatExample
//
//  Created by demothreen on 01.05.2022.
//

import UIKit

class ListVC: BaseVC {
  var collectionView: UICollectionView = {
    let collView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    return collView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    view.addSubview(collectionView)
    collectionView.frame = self.view.bounds
    collectionView.registerCell(UICollectionViewCell.self)
    collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueCell(UICollectionViewCell.self, for: indexPath)
    cell.backgroundColor = .red
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
  static var previews: some View {
    ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portraitUpsideDown)
  }

  struct ContainerView: UIViewControllerRepresentable {
    let viewController = ListVC()
    func makeUIViewController(context: Context) -> UIViewController {
      return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
  }
}
