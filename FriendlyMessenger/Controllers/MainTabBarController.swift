//
//  MainTabBarController.swift
//  FriendlyMessenger
//
//  Created by Максим Боталов on 01.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SetupColor.secondaryBlackColor()
        settingsTabBarControllers()
    }
    
    private func settingsTabBarControllers() {
        let chatsViewController = creationNavigationController(viewController: ChatsViewController(), nameItem: "Chats", nameImageItem: "message")

        viewControllers = [chatsViewController]
    }
    
    private func creationNavigationController(viewController: UIViewController, nameItem: String, nameImageItem: String) -> UINavigationController {
        let item = UITabBarItem(title: nameItem, image: UIImage(systemName: nameImageItem), tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
