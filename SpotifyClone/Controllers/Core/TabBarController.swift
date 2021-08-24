//
//  TabBarController.swift
//  SpotifyClone
//
//  Created by Nikos Aggelidis on 24/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension TabBarController {
    func setupUI() {
        tabBar.backgroundColor = .label
        tabBarViewControllersConfiguration()
    }
    
    func tabBarViewControllersConfiguration() {
        let homeViewController = HomeViewController()
        homeViewController.title = "Browse"
        homeViewController.navigationItem.largeTitleDisplayMode = .always
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.navigationBar.prefersLargeTitles = true
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        searchViewController.navigationItem.largeTitleDisplayMode = .always
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        searchNavigationController.navigationBar.prefersLargeTitles = true
        searchNavigationController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let libraryViewController = LibraryViewController()
        libraryViewController.title = "Library"
        libraryViewController.navigationItem.largeTitleDisplayMode = .always
        let libraryNavigationController = UINavigationController(rootViewController: libraryViewController)
        libraryNavigationController.navigationBar.prefersLargeTitles = true
        libraryNavigationController.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 2)
        setViewControllers([homeNavigationController, searchNavigationController, libraryNavigationController], animated: true)
    }
}
