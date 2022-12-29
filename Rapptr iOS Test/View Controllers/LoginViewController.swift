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
        
        setupNavBar(title: title ?? "")
        configureUIElements()
        layoutUIElements()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
//    @IBAction func backAction(_ sender: Any) {
//        let mainMenuViewController = MenuViewController()
//        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
//    }
    
//    @IBAction func didPressLoginButton(_ sender: Any) {
//    }
    
    @objc private func loginButtonTapped(sender: UIButton) {
        print("loginButtontapped")
        
        guard let email = emailTextField.text else {
            return }
        guard let password = passwordTextField.text else {
            return }
        
        client?.login(email: email, password: password, completion: { responseTime in
            self.displayAlert(withResponseTime: responseTime, withError: nil)
            
        }, error: { error in
            self.displayAlert(withResponseTime: nil, withError: error)
            
        })
        
    }
    
    func displayAlert(withResponseTime: String?, withError: String?) {
        
        if let responseTime = withResponseTime {
            let alert = UIAlertController(title: "Success", message: responseTime, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Okay", style: .default) { action in
                //pop the current (login) controller to go back to menu controller
                self.navigationController?.popViewController(animated: true)
                
            }
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        if let error = withError {
            
            let alert = UIAlertController(title: "Unsuccessful", message: "Login was unsuccessful.\n" + error, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Okay", style: .default) { action in
                
                self.dismiss(animated: true, completion: nil)
                
            }
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func configureUIElements() {
        
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
        
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
   
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.set(backgroundColor: .white, placeholder: "Email")

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.set(backgroundColor: .white, placeholder: "Password")
        

        loginButton.set(backgroundColor: UIColor(named: "Rapptr_Blue")!, title: "LOGIN")
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    func layoutUIElements() {
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
           
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

extension LoginViewController : UITextFieldDelegate {
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.emailTextField {
            textField.resignFirstResponder()
            return false
            
        }
        
        if textField == self.passwordTextField {
            textField.resignFirstResponder()
            return false
        }
        
        return true
        
        
    }
}
