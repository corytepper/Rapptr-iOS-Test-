//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 *
 * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
 *
 * 2) Use Autolayout to make sure all UI works for each resolution
 *
 * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
 *    provided code if necessary. It is ok to add any classes. This is your project now!
 *
 * 4) Read the additional instructions comments throughout the codebase, they will guide you.
 *
 * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
 *
 * Thank you and Good luck. - Rapptr Labs
 * =========================================================================================
 */

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var animationButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coding Tasks"
        setupNavBar()
    }
    
    // MARK: - Actions
    @IBAction func didPressChatButton(_ sender: Any) {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func didPressAnimationButton(_ sender: Any) {
        let animationViewController = AnimationViewController()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
    
    func setupNavBar() {
        //        navigationController?.navigationBar.backgroundColor = UIColor(named: "Rapptr_Blue")
        
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(named: "Rapptr_Blue")
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .white
        
        
        //        navigationController?.navigationBar.barTintColor = UIColor(named: "Rapptr_Blue")
        //        navigationController?.navigationBar.tintColor = UIColor.white
        //        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        //        navigationItem.backBarButtonItem = UIBarButtonItem(title: "  ", style: .plain, target: nil, action: nil)
    }
}
