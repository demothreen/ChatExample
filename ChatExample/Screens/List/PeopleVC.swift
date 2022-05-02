//
//  PeopleVC.swift
//  ChatExample
//
//  Created by demothreen on 01.05.2022.
//

import UIKit

class PeopleVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .mainWhite
    setupSearchBar()
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

}

extension PeopleVC: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print("### searchtext", searchText)
  }
}
