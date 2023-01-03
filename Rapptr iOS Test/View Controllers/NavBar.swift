//
//  NavBar.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 12/19/22.
//

import UIKit


extension UIViewController {
    
    func setupNavBar(title: String) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(named: "Rapptr_Blue")
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let labelTitle = UILabel()

        let titleAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
                                                        .foregroundColor: UIColor.white]

        let attributeString = NSMutableAttributedString(string: title, attributes: titleAttribute)

        labelTitle.attributedText = attributeString

        labelTitle.sizeToFit()
        
        navigationItem.titleView = labelTitle
        navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.tintColor = .white
    }
}
