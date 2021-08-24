//
//  WelcomeViewController.swift
//  SpotifyClone
//
//  Created by Nikos Aggelidis on 24/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension WelcomeViewController {
    func setupUI() {
        title = "Spotify"
        view.backgroundColor = .green
    }
}
