//
//  AppDelegate.swift
//  SpotifyClone
//
//  Created by Nikos Aggelidis on 24/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        if AuthManager.shared.isSignedIn {
            window.rootViewController = TabBarController()
        } else {
            let welcomeNavigationController = UINavigationController(rootViewController: WelcomeViewController())
            welcomeNavigationController.navigationBar.prefersLargeTitles = true
            welcomeNavigationController.viewControllers.first?.navigationItem.largeTitleDisplayMode = .always
            window.rootViewController = welcomeNavigationController
        }
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
