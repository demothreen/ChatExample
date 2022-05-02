//
//  ListVC.swift
//  ChatExample
//
//  Created by demothreen on 01.05.2022.
//

import UIKit

class ListVC: UIViewController {
  var collectionView: UICollectionView = {
    let collView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    return collView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .mainWhite
    setupSearchBar()
    setupUI()
  }

  private func setupSearchBar() {
    navigationController?.navigationBar.barTintColor = .lightGray
    navigationController?.navigationBar.shadowImage = UIImage()
    let searchVC = UISearchController(searchResultsController: nil)
    searchVC.hidesNavigationBarDuringPresentation = false
    searchVC.obscuresBackgroundDuringPresentation = false
    searchVC.searchBar.delegate = self
    navigationItem.searchController = searchVC
    navigationItem.hidesSearchBarWhenScrolling = false
  }

  private func setupUI() {
    view.addSubview(collectionView)
    collectionView.frame = self.view.bounds
    collectionView.registerCell(UICollectionViewCell.self)
    collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    collectionView.backgroundColor = .mainWhite
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension ListVC: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print("### searchtext", searchText)
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

extension ListVC: UICollectionViewDelegateFlowLayout {
  override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
    return CGSize(width: view.frame.width, height: 64)
  }
}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
  static var previews: some View {
    ContainerView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portraitUpsideDown)
  }

  struct ContainerView: UIViewControllerRepresentable {
    let viewController = MainTabBarController()
    func makeUIViewController(context: Context) -> UIViewController {
      return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
  }
}
