//
//  Rapptr_TextField.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 12/16/22.
//

import UIKit

class RapptrTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, placeholder: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        
    }
    
    private func configure() {
        self.borderStyle = .roundedRect
        self.keyboardType = .emailAddress
        self.textContentType = .emailAddress
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.textAlignment = .left
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        self.setLeftPaddingPoints(24)
        
//
        
        
    }
    
    
    func set(backgroundColor: UIColor, placeholder: String) {
        self.backgroundColor = backgroundColor
        
    }
    
}



    
   
    
