//
//  AlertViewContainer.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 1/1/23.
//

import UIKit

class RapptrAlertContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        backgroundColor    = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth  = 2
        layer.borderColor  = UIColor.white.cgColor

        translatesAutoresizingMaskIntoConstraints = false
    }
}
