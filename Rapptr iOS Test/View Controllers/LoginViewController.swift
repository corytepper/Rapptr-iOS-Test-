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
 * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
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
    private var client: LoginClient?
    
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
        
        configureUIElements()
        layoutUIElements()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
    }
    
    
    
    func configureUIElements() {
        
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
        
//        stackView.addArrangedSubview(emailTextField)
//        stackView.addArrangedSubview(passwordTextField)
//        stackView.addArrangedSubview(loginButton)
//
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: image)
        backgroundImage.isUserInteractionEnabled = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .center
//        stackView.distribution = .fill
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        
        
//        backgroundImage.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
//        emailTextField.backgroundColor = .white
//        emailTextField.backgroundColor?.withAlphaComponent(0.5)
//        emailTextField.layer.cornerRadius = 6
        emailTextField.set(backgroundColor: .white, placeholder: "Info@rapptrlabs.com")
//        emailTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
    
        
//        backgroundImage.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//        passwordTextField.backgroundColor = .white
//        passwordTextField.backgroundColor?.withAlphaComponent(0.5)
//        passwordTextField.layer.cornerRadius = 6
        passwordTextField.set(backgroundColor: .red, placeholder: "password")
//        passwordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        
        

//        backgroundImage.addSubview(loginButton)
        loginButton.set(backgroundColor: UIColor(named: "Rapptr_Blue")!, title: "LOGIN")
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
//        loginButton.backgroundColor = UIColor(named: "Rapptr_Blue")
//        loginButton.setTitle("LOGIN", for: .normal)
    }
    
    func layoutUIElements() {
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            stackView.heightAnchor.constraint(equalToConstant: 50),
//            stackView.widthAnchor.constraint(equalToConstant: 150),
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 164),
//            stackView.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 10),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
           
//
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
//            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -54),
//
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -54),
////
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        
        ])
    }
}
