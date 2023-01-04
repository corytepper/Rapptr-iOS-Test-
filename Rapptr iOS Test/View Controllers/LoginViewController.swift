//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.


/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Take email and password input from the user
 *
 * 3) Use the endpoint and parameters provided in LoginClient  to perform the log in
 *
 * 4) Calculate how long the API call took in milliseconds
 *
 * 5) If the response is an error display the error in a UIAlertController
 *
 * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
 *
 * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
 **/

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    var client = LoginClient()
    
    let image = "img_login"
    
    let backgroundImage = UIImageView()
    let stackView = UIStackView()
    let emailTextField = RapptrTextField()
    let passwordTextField = RapptrTextField()
    let loginButton = RapptrButton()
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        setupNavBar(title: title ?? "")
        configureUIElements()
        layoutUIElements()
    }
    
    // MARK: - Interaction
    @objc private func loginButtonTapped(sender: UIButton) {
        guard let email = emailTextField.text else {
            return }
        guard let password = passwordTextField.text else {
            return }
        
        client.login(email: email, password: password, completion: { responseTime in
            self.presentRapptrAlert(title: "Login Complete", message: responseTime , buttonTitle: "OK", popToRootVC: true)
            
        }, error: { error in
            self.presentRapptrAlert(title: "Error", message: "\(error!)", buttonTitle: "Try Again!", popToRootVC: false)
        })
    }
    
    
    // MARK: - Setup
    func configureUIElements() {
        view.addSubview(backgroundImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: image)
        backgroundImage.isUserInteractionEnabled = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .center
 
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        
        view.addSubview(stackView)
   
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.set(backgroundColor: .white, placeholder: "Email")
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.set(backgroundColor: .white, placeholder: "Password")
        
        loginButton.set(backgroundColor: UIColor(named: "Rapptr_Blue")!, title: "LOGIN")
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    
    func layoutUIElements() {
        
        backgroundImage.pinToEdges(of: view)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
}
