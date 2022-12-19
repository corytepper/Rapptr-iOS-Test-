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
        self.attributedPlaceholder = NSAttributedString(string: "yourPlaceholderText")
        self.placeholder = "\(placeholder)"
        
    }
    
    private func configure() {
        self.borderStyle = .roundedRect
        self.keyboardType = .emailAddress
        self.textContentType = .emailAddress
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.textAlignment = .left
        
        self.setLeftPaddingPoints(24)
        
//        self.alpha = 0.6
//        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        self.textColor = .black
    }
    
    
    
    
    
    
    func set(backgroundColor: UIColor, placeholder: String) {
        self.backgroundColor = backgroundColor.withAlphaComponent(0.6)
//        self.placeholder = "\(placeholder)"
//        self.attributedPlaceholder = NSAttributedString(string: "yourPlaceholderText")
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular), NSAttributedString.Key.foregroundColor : UIColor(named: "Rapptr_Gray_placeholder")]
        let attributedText = NSAttributedString(string: placeholder, attributes: attributes as [NSAttributedString.Key : Any])
        self.attributedPlaceholder = attributedText
        
    }
    
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

    
   
    
