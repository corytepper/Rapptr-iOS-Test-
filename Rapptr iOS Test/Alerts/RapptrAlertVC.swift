//
//  AlertViewController.swift
//  Rapptr iOS Test
//
//  Created by Cory Tepper on 1/1/23.
//

import UIKit



final class Rapptr_AlertVC: UIViewController {
    private let containerView = RapptrAlertContainerView()
    private let titleLabel    = UILabel()
    private let messageLabel  = UILabel()
    private let actionButton  = RapptrButton(backgroundColor: .red, title: "Ok")
    
    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?
    private var popToRootVC = Bool()
    
    private let padding: CGFloat = 20
    
    
    init(title: String, message: String?, buttonTitle: String, popToRootVC: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle    = title
        self.message       = message
        self.buttonTitle   = buttonTitle
        self.popToRootVC   = popToRootVC
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubviews(containerView,titleLabel,actionButton,messageLabel)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }

    
    private func configureContainerView() {
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    
    private func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        titleLabel.textColor                 = .label
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor        = 0.9
        titleLabel.lineBreakMode             = .byTruncatingTail
        titleLabel.textAlignment             = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    
    private func configureActionButton() {
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    private func configureMessageLabel() {
        messageLabel.text           = message ?? "Unable to complete request"
        messageLabel.numberOfLines  = 4
        
        messageLabel.textColor                         = .secondaryLabel
        messageLabel.font                              = UIFont.preferredFont(forTextStyle: .body)
        messageLabel.adjustsFontForContentSizeCategory = true
        messageLabel.adjustsFontSizeToFitWidth         = true
        messageLabel.minimumScaleFactor                = 0.75
        messageLabel.lineBreakMode                     = .byWordWrapping
        messageLabel.textAlignment                     = .center
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
    
}
        
    
