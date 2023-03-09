//
//  LoginController.swift
//
//  Created by Steellson


import UIKit


//MARK: - LoginController

final class LoginController: UIViewController {
    
    var presenter      : LoginPresenterProtocol!
    var keyboardHelper : KeyboardContentPusher!
    let validType      : String.ValidTypes = .name
    
    //MARK: - UI Elements
    
    let unicornView   = UIImageView(image: Resources.RImages.unicornImage)
    let loginLabel    = UILabel(Resources.RFonts.helveticaBold40, .white, .center, "LOGIN")
    let emailField    = UITextField().buildAuthField(with: "Enter e-mail", Resources.RColors.grayColor.cgColor)
    let passwordField = UITextField().buildAuthField(with: "Enter password", Resources.RColors.grayColor.cgColor)
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
        view.backgroundColor  = Resources.RColors.purpleMainColor
        
        view.addSubview(unicornView)
        view.addSubview(loginLabel)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        emailField.delegate    = self
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
        
        signInButton.addTarget(self, action: #selector(signInButtonDidTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)
    }
}

//MARK: - LoginControllerViewProtocol Extension

extension LoginController: LoginControllerProtocol {

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

