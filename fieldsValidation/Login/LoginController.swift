//
//  LoginController.swift
//
//  Created by Steellson


import UIKit


//MARK: - LoginController

final class LoginController: UIViewController {
    
    //MARK: - UI Elements
    
    let loginLabel    = UILabel(UIFont(name: "Arial", size: 35)!, .systemGreen, .center, "Login") //
    let emailField    = UITextField().buildAuthField(with: "Enter e-mail")
    let passwordField = UITextField().buildAuthField(with: "Enter password")
    let signInButton  = UIButton("SignIN", .systemYellow, .white)
    let signUpButton  = UIButton("SignUP", .systemGreen, .systemPink)
    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }

}


//MARK: - LoginController Extension

extension LoginController {
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.5557171106, green: 0.5678942204, blue: 0.7974012494, alpha: 1)
        
        view.addSubview(loginLabel)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
      
        emailField.delegate    = self
        passwordField.delegate = self
    }

}

//MARK: - UITextFieldDelegate Extension

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
