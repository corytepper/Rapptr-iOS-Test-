//
//  NavBar.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 12/19/22.
//

import UIKit


extension UIViewController {
    
    func setupNavBar(title: String) {
        //        navigationController?.navigationBar.backgroundColor = UIColor(named: "Rapptr_Blue")
        
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(named: "Rapptr_Blue")
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let lblTitle = UILabel()

        let titleAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
                                                        .foregroundColor: UIColor.white]

        let attributeString = NSMutableAttributedString(string: title, attributes: titleAttribute)

        lblTitle.attributedText = attributeString

        lblTitle.sizeToFit()
        navigationItem.titleView = lblTitle
        
        
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .white
        
        
        //        navigationController?.navigationBar.barTintColor = UIColor(named: "Rapptr_Blue")
        //        navigationController?.navigationBar.tintColor = UIColor.white
        //        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        //        navigationItem.backBarButtonItem = UIBarButtonItem(title: "  ", style: .plain, target: nil, action: nil)
    }
}
