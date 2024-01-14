//
//  WelcomeViewController.swift
//  Spotify-App
//
//  Created by Ibukunoluwa Akintobi on 04/01/2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let signInButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign in with spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(
            x: 20,
            y: view.height - 50 - view.safeAreaInsets.bottom,
            width: view.width - 40,
            height: 50
        )
    }
    
    @objc func didTapSignIn () {
        let vc = AuthViewController()
        vc.completionHandler = {
            [weak self] success in DispatchQueue.main.async {
                self?.handleSignIn(success:success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    private func handleSignIn(success: Bool) {
        
    }
}
