//
//  LoginController.swift
//
//  Created by Steellson


import UIKit


//MARK: - LoginController

final class LoginController: UIViewController {
    
    var presenter      : AuthorizationPresenterProtocol!
    var keyboardHelper : KeyboardContentPusher!
    let validType      : String.ValidTypes = .name
    
    //MARK: - UI Elements
    
    let unicornView  = UIImageView(image: UIImage(named: "unicorn")!)
    let loginLabel    = UILabel(UIFont(name: "Helvetica-Bold", size: 40)!, .white, .center, "LOGIN")
    let emailField    = UITextField().buildAuthField(with: "Enter e-mail")
    let passwordField = UITextField().buildAuthField(with: "Enter password")
    let signInButton  = UIButton("SIGN-IN", .red, .white, 20)
    let signUpButton  = UIButton("SIGN-UP", .blue, .white, 20)
    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        
        keyboardHelper = KeyboardContentPusher(observedView: view)
        keyboardHelper.activateObserve()
    }
    
    deinit {
        keyboardHelper.stopObverve()
    }
    
    //MARK: - Buttons Actions
    
    @objc private func signInButtonDidTapped() {
        presenter.signInButtonDidTapped()
    }
    
    @objc private func signUpButtonDidTapped() {
        presenter.signUpButtonDidTapped()
    }
}


//MARK: - LoginController Extension

extension LoginController {
    
    private func setupView() {
        view.backgroundColor  = #colorLiteral(red: 0.5557171106, green: 0.5678942204, blue: 0.7974012494, alpha: 1)
        
        view.addSubview(unicornView)
        view.addSubview(loginLabel)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        emailField.delegate    = self
        passwordField.delegate = self
        
        signInButton.addTarget(self, action: #selector(signInButtonDidTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)
    }
}

//MARK: - LoginControllerViewProtocol Extension

extension LoginController: AuthorizationControllerProtocol {
    func show() {
        
    }
}

//MARK: - UITextFieldDelegate Extension

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

