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
    
    let unicornView   = UIImageView(image: Resources.RImages.unicornImage)
    let loginLabel    = UILabel(Resources.RFonts.helveticaBold40, .white, .center, "LOGIN")
    let emailField    = TextField().buildTextField(with: "Enter e-mail", Resources.RColors.defaultTextFieldGrayColor.cgColor)
    let passwordField = TextField().buildTextField(with: "Enter password", Resources.RColors.defaultTextFieldGrayColor.cgColor)
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
        view.backgroundColor  = Resources.RColors.defaultBackgroundColor
        
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

