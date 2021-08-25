//
//  AuthViewController.swift
//  SpotifyClone
//
//  Created by Nikos Aggelidis on 24/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {
    private let webKitWebView: WKWebView = {
        let webKitWebpagePreferences = WKWebpagePreferences()
        webKitWebpagePreferences.allowsContentJavaScript = true
        let webKitWebViewConfiguration = WKWebViewConfiguration()
        webKitWebViewConfiguration.defaultWebpagePreferences = webKitWebpagePreferences
        let webKitWebView = WKWebView(frame: .zero, configuration: webKitWebViewConfiguration)
        
        return webKitWebView
    }()
    
    var completionHandler: ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadWebKitWebViewWithURL()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        webKitWebView.frame = view.bounds
    }
}

private extension AuthViewController {
    func setupUI() {
        title = "Sign In"
        view.backgroundColor = .systemBackground
        view.addSubview(webKitWebView)
        webKitWebView.navigationDelegate = self
    }
    
    func loadWebKitWebViewWithURL() {
        guard let signInURL = AuthManager.shared.signInURL else { return }
        webKitWebView.load(URLRequest(url: signInURL))
    }
}

extension AuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let webKitWebViewURL = webKitWebView.url else { return }
        guard let code = URLComponents(string: webKitWebViewURL.absoluteString)?.queryItems?.first(where: { $0.name == "code" })?.value else { return }
        
    }
}
