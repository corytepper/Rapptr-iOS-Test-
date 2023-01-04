//
//  Rapptr_Button.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 12/16/22.
//

import UIKit

class RapptrButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    
    private func configure() {
        layer.cornerRadius = 0
        titleLabel?.font   = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
}
