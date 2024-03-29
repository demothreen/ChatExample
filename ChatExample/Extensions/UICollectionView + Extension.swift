//
//  UICollectionView + Extension.swift
//  ChatExample
//
//  Created by demothreen on 01.05.2022.
//

import UIKit

extension UICollectionView {
  func registerCell<Cell: UICollectionViewCell>(_ cell: Cell.Type) {
    register(Cell.self, forCellWithReuseIdentifier: reuseIdentifier(for: cell))
  }

  private func reuseIdentifier<Cell: UICollectionViewCell>(for cell: Cell.Type) -> String {
    String(describing: cell)
  }

  private func dequeueConfiguringCell<Cell: ConfiguringCell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
    return dequeueReusableCell(withReuseIdentifier: String(describing: cell), for: indexPath) as! Cell
  }

  func dequeueCell<Cell: UICollectionViewCell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
    if let cell = dequeueReusableCell(withReuseIdentifier: String(describing: cell), for: indexPath) as? Cell {
      return cell
    }
    return Cell()
  }

  func configure<T: ConfiguringCell, U: Hashable>(cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
    let cell = self.dequeueConfiguringCell(cellType, for: indexPath)
    cell.configure(with: value)
    return cell
  }
}
