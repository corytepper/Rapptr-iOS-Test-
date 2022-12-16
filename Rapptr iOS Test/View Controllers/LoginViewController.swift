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
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
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
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: image)
        backgroundImage.isUserInteractionEnabled = true
        
        
        
        
        backgroundImage.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .white
        emailTextField.backgroundColor?.withAlphaComponent(0.5)
        emailTextField.layer.cornerRadius = 6
    
    
        
        backgroundImage.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .white
        passwordTextField.backgroundColor?.withAlphaComponent(0.5)
        passwordTextField.layer.cornerRadius = 6
        
        
        

        backgroundImage.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = UIColor(named: "Rapptr_Blue")
        loginButton.setTitle("LOGIN", for: .normal)
    }
    
    func layoutUIElements() {
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
            emailTextField.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 64),
            emailTextField.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -30),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -54),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            passwordTextField.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -30),
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -54),
            
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -30)
        
        ])
    }
}
