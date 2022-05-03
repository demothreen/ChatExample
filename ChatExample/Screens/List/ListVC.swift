//
//  ListVC.swift
//  ChatExample
//
//  Created by demothreen on 01.05.2022.
//

import UIKit

class ListVC: UIViewController {
  let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
  let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")

  enum Section: Int, CaseIterable {
    case waitingChats, activeChats
    func description() -> String {
      switch self {
      case .waitingChats: return "Waiting chats"
      case .activeChats: return "Active chats"
      }
    }
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
    collectionView.registerCell(ActiveChatCell.self)
    collectionView.registerCell(WaitingChatCell.self)
    collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
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
        return collectionView.configure(cellType: ActiveChatCell.self, with: chat, for: indexPath)
      case .waitingChats:
        return collectionView.configure(cellType: WaitingChatCell.self, with: chat, for: indexPath)
      }
    })

    dataSource?.supplementaryViewProvider = {
      collectionView, kind, indexPath in
      guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else { fatalError("Can not create new section header") }
      guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section kind") }
      sectionHeader.configure(
        text: section.description(),
        fontSize: 20,
        textColor: #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1))
      return sectionHeader
    }
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
    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 20
    layout.configuration = config
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

    let sectionHeader = createSectionHeader()
    section.boundarySupplementaryItems = [sectionHeader]
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

    let sectionHeader = createSectionHeader()
    section.boundarySupplementaryItems = [sectionHeader]
    return section
  }

  private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
    let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
      layoutSize: sectionHeaderSize,
      elementKind: UICollectionView.elementKindSectionHeader,
      alignment: .top
    )
    return sectionHeader
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
