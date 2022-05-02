//
//  ListVC.swift
//  ChatExample
//
//  Created by demothreen on 01.05.2022.
//

import UIKit

struct MChat: Hashable, Decodable {
  var username: String
  var userImageString: String
  var lastMessage: String
  var id: Int

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: MChat, rhs: MChat) -> Bool {
    return lhs.id == rhs.id
  }
}

class ListVC: UIViewController {
  let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
  let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")

  enum Section: Int, CaseIterable {
    case waitingChats, activeChats
  }
  var collectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .mainWhite
    setupSearchBar()
    setupUI()
    createDataSource()
    reloadData()
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
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: setCompositionalLayout())
    view.addSubview(collectionView)
    collectionView.frame = self.view.bounds
    collectionView.registerCell(UICollectionViewCell.self)
    collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    collectionView.backgroundColor = .mainWhite
  }

  private func createDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
      guard let section = Section(rawValue: indexPath.section) else {
        fatalError("Unknown section kind")
      }

      switch section {
      case .activeChats:
        let cell = collectionView.dequeueCell(UICollectionViewCell.self, for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
      case .waitingChats:
        let cell = collectionView.dequeueCell(UICollectionViewCell.self, for: indexPath)
        cell.backgroundColor = .blue
        return cell
      }
    })
  }

  private func setCompositionalLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { index, enviropment in
      guard let section = Section(rawValue: index) else {
        fatalError("Unknown section kind")
      }
      switch section {
      case .activeChats:
        return self.createActiveChats()
      case .waitingChats:
        return self.createWaitingChats()
      }
    }
    return layout
  }

  private func createWaitingChats() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

    let section = NSCollectionLayoutSection(group: group)
    section.interGroupSpacing = 20
    section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
    section.orthogonalScrollingBehavior = .continuous
    return section
  }

  private func createActiveChats() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(78))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

    let section = NSCollectionLayoutSection(group: group)
    section.interGroupSpacing = 8
    section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
    return section
  }

  private func reloadData() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
    snapshot.appendSections([.waitingChats, .activeChats])
    snapshot.appendItems(waitingChats, toSection: .waitingChats)
    snapshot.appendItems(activeChats, toSection: .activeChats)
    dataSource?.apply(snapshot, animatingDifferences: true)
  }
}

extension ListVC: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print("### searchtext", searchText)
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
