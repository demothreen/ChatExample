//
//  MainTabBarController.swift
//  ChatExample
//
//  Created by demothreen on 01.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let listViewController = ListVC()
    let peopleViewController = PeopleVC()

    tabBar.tintColor = .red
    let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
    let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)!
    let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!

    viewControllers = [
      generateNavigationController(rootViewController: listViewController, title: "Conversations", image: convImage),
      generateNavigationController(rootViewController: peopleViewController, title: "People", image: peopleImage)
    ]
  }

  private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
    let navigationVC = UINavigationController(rootViewController: rootViewController)
    navigationVC.tabBarItem.title = title
    navigationVC.tabBarItem.image = image
    return navigationVC
  }
}
