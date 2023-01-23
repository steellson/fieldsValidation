//
//  RegistrationController.swift
//
//  Created by Steellson


import UIKit


//MARK: - RegistrationController

final class RegistrationController: UIViewController {
    
    var presenter      : AuthorizationPresenterProtocol!
    var keyboardHelper : KeyboardContentPusher!
    
    //MARK: - UI Elements
    
    let registrationTitle = UILabel(UIFont(name: "Helvetica-Bold", size: 40)!, .white, .center, "Registration")
    let firstNameField    = UITextField().buildAuthField(with: "First Name")
    var firstNameLabel    = UILabel(UIFont(name: "Helvetica-Bold", size: 15)!, #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), .left, "Required field")
    let secondNameField   = UITextField().buildAuthField(with: "Second Name")
    var secondNameLabel   = UILabel(UIFont(name: "Helvetica-Bold", size: 15)!, #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), .left, "Required field")
    let birthdayField     = UITextField().buildAuthField(with: "Birthday")
    var birthdayLabel     = UILabel(UIFont(name: "Helvetica-Bold", size: 15)!, #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), .left, "Required field")
    let phoneField        = UITextField().buildAuthField(with: "Phone")
    var phoneLabel        = UILabel(UIFont(name: "Helvetica-Bold", size: 15)!, #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), .left, "Required field")
    let emailField        = UITextField().buildAuthField(with: "Email")
    var emailLabel        = UILabel(UIFont(name: "Helvetica-Bold", size: 15)!, #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), .left, "Required field")
    let passwordField     = UITextField().buildAuthField(with: "Password")
    var passwordLabel     = UILabel(UIFont(name: "Helvetica-Bold", size: 15)!, #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), .left, "Required field")
    var signUpButton      = UIButton("SIGN-UP", .blue, .white, 24)
    
    lazy var stackView = UIStackView([
        firstNameField,   firstNameLabel,
        secondNameField, secondNameLabel,
        birthdayField,   birthdayLabel,
        phoneField,      phoneLabel,
        emailField,      emailLabel,
        passwordField,   passwordLabel,
    ], .vertical, 0, .fillEqually)
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setDelegates()
        setupLayout()
        
        keyboardHelper = KeyboardContentPusher(observedView: view)
        keyboardHelper.activateObserve()
    }
    
    deinit {
        keyboardHelper.stopObverve()
    }
    
    
    
    //MARK: - Button actions
    
    @objc func signUpButtonDidTapped() {
        presenter.registrationCompleted()
    }
}


//MARK: - RegistrationController Extension

extension RegistrationController {
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.5557171106, green: 0.5678942204, blue: 0.7974012494, alpha: 1)
        
        view.addSubview(registrationTitle)
        view.addSubview(stackView)
        view.addSubview(signUpButton)
    
        signUpButton.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)
    }
    
    private func setDelegates() {
        firstNameField.delegate   = self
        secondNameField.delegate = self
        birthdayField.delegate   = self
        phoneField.delegate      = self
        emailField.delegate      = self
        passwordField.delegate   = self

    }
}

//MARK: - RegistrationControllerViewProtocol Extension

extension RegistrationController: AuthorizationControllerProtocol {
    func show() {
        
    }
}


//MARK: - RegistrationController Validation Extension
    
extension RegistrationController {
    
    private func set(textField: UITextField,
             label: UILabel,
             validType: String.ValidTypes,
             validMessage: String,
             wrongMessage: String,
             string: String,
             range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validType: validType) {
            label.text = validMessage
            label.textColor = #colorLiteral(red: 0.02528674155, green: 0.901473999, blue: 0.9878204465, alpha: 1)
        } else {
            label.text = wrongMessage
            label.textColor = #colorLiteral(red: 0.7254902124, green: 0, blue: 0.09803921729, alpha: 1)
        }
    }
}


//MARK: - UITextFieldDelegate Extension

extension RegistrationController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case firstNameField: set(textField: firstNameField,
                                label: firstNameLabel,
                                validType: .name,
                                validMessage: "Name is valid!",
                                wrongMessage: "Name is invalid!",
                                string: string,
                                range: range)
        case secondNameField: set(textField: secondNameField,
                                  label: secondNameLabel,
                                  validType: .name,
                                  validMessage: "Second name is valid!",
                                  wrongMessage: "Second name is invalid!",
                                  string: string,
                                  range: range)
        case birthdayField: set(textField: birthdayField,
                                label: birthdayLabel,
                                validType: .birthDate,
                                validMessage: "Birthday is valid!",
                                wrongMessage: "Birthday is invalid!",
                                string: string,
                                range: range)
        case phoneField: set(textField: phoneField,
                             label: phoneLabel,
                             validType: .phone,
                             validMessage: "Phone is valid!",
                             wrongMessage: "Phone is invalid!",
                             string: string,
                             range: range)
        case emailField: set(textField: emailField,
                             label: emailLabel,
                             validType: .email,
                             validMessage: "Mail is valid!",
                             wrongMessage: "Mail is invalid!",
                             string: string,
                             range: range)
        case passwordField: set(textField: passwordField,
                                label: passwordLabel,
                                validType: .password,
                                validMessage: "Password is valid!",
                                wrongMessage: "Password is invalid!",
                                string: string,
                                range: range)
        default:
            print("TextField validation error")
        }
        
        return false
    }
 
}
