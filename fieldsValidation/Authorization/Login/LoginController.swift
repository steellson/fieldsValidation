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
    let emailField    = UITextField().buildAuthField(with: "Enter e-mail", Resources.RColors.defaultTextFieldGrayColor)
    let passwordField = UITextField().buildAuthField(with: "Enter password", Resources.RColors.defaultTextFieldGrayColor)
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
        
        signInButton.addTarget(self, action: #selector(signInButtonDidTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)
    }
}

//MARK: - LoginControllerViewProtocol Extension

extension LoginController: AuthorizationControllerProtocol {
    func startLoading() {
        //
    }
    
    func finishLoading() {
        //
    }
    
    func signInDidTapped() {
        let mail     = emailField.text ?? ""
        let password = passwordField.text ?? ""
        let user     = presenter.findUser(by: mail)
        
        if user != nil  {
            emailField.textColor = .systemGreen
            if user?.password == password {
                
                /////// PLACE FOR TRANSITION //////////
                
                print("Success login of \(user!)")
            } else {
                let alert  = AlertController(header: nil,
                                             message: Resources.Strings.loginAlertWrongMailOrPass.rawValue,
                                             actionPossibility: true)
                present(alert, animated: true)
            }
        } else {
            emailField.textColor = .red
            
            let alert  = AlertController(header: Resources.Strings.loginAlertUserNotFoundTitle.rawValue,
                                         message: Resources.Strings.loginAlertUserNotFound.rawValue,
                                         actionPossibility: true)
            present(alert, animated: true)
            
        }
    }
}

//MARK: - UITextFieldDelegate Extension

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

