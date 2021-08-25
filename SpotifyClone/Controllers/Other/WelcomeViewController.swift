//
//  WelcomeViewController.swift
//  SpotifyClone
//
//  Created by Nikos Aggelidis on 24/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    private let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .white
        signInButton.setTitle("Sign In with Spotify", for: .normal)
        signInButton.setTitleColor(.blue, for: .normal)
        
        return signInButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        signInButton.frame = CGRect(x: 20, y: view.height - 50 - view.safeAreaInsets.bottom, width: view.width - 40, height: 50)
    }
}

private extension WelcomeViewController {
    func setupUI() {
        title = "Spotify"
        view.backgroundColor = .green
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(signInButtonTouchUpInside), for: .touchUpInside)
    }
    
    @objc func signInButtonTouchUpInside() {
        let authViewController = AuthViewController()
        authViewController.navigationItem.largeTitleDisplayMode = .never
        authViewController.completionHandler = { success in
            
        }
        navigationController?.pushViewController(authViewController, animated: true)
    }
}
