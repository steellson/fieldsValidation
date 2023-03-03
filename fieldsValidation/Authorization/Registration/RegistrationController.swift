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
    
    let registrationTitle = UILabel(Resources.RFonts.helveticaBold40, .white, .center, "Registration")
    let firstNameField = UITextField().buildAuthField(with: "First Name", Resources.RColors.registrationFieldGrayColor.cgColor)
    var firstNameLabel = UILabel(Resources.RFonts.helveticaBold15,Resources.RColors.validationLabelColor, .left, "Required field")
    let secondNameField = UITextField().buildAuthField(with: "Second Name", Resources.RColors.registrationFieldGrayColor.cgColor)
    var secondNameLabel = UILabel(Resources.RFonts.helveticaBold15, Resources.RColors.validationLabelColor, .left, "Required field")
    let birthdayField = UITextField().buildAuthField(with: "Birthday", Resources.RColors.registrationFieldGrayColor.cgColor)
    var birthdayLabel = UILabel(Resources.RFonts.helveticaBold15, Resources.RColors.validationLabelColor, .left, "Required field")
    let ageDatePicker = UIDatePicker()
    let phoneField = UITextField().buildAuthField(with: "Phone", Resources.RColors.registrationFieldGrayColor.cgColor, false, .numberPad)
    var phoneLabel = UILabel(Resources.RFonts.helveticaBold15, Resources.RColors.validationLabelColor, .left, "Required field")
    let emailField = UITextField().buildAuthField(with: "Email", Resources.RColors.registrationFieldGrayColor.cgColor)
    var emailLabel = UILabel(Resources.RFonts.helveticaBold15, Resources.RColors.validationLabelColor, .left, "Required field")
    let passwordField = UITextField().buildAuthField(with: "Password", Resources.RColors.registrationFieldGrayColor.cgColor, true)
    var passwordLabel = UILabel(Resources.RFonts.helveticaBold15, Resources.RColors.validationLabelColor, .left, "Required field")
    var goRegButton = UIButton("GO REG!", .blue, .white, 24)
    
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
        
        keyboardHelper = KeyboardContentPusher(observedView: view, pushMultiplier: 1.95)
        keyboardHelper.activateObserve()
    }
    
    deinit {
        keyboardHelper.stopObverve()
    }
    
    
    
    //MARK: - Button actions
    
    @objc func goRegButtonDidTapped() {
        presenter.goRegButtonDidTapped()
    }
}


//MARK: - RegistrationController Extension

extension RegistrationController {
    
    private func setupView() {
        view.backgroundColor = Resources.RColors.defaultBackgroundColor
        
        view.addSubview(registrationTitle)
        view.addSubview(stackView)
        view.addSubview(goRegButton)
        
        birthdayField.leftView = ageDatePicker
        
        goRegButton.addTarget(self, action: #selector(goRegButtonDidTapped), for: .touchUpInside)
    }
    
    private func setDelegates() {
        firstNameField.delegate  = self
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
        //
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
            label.textColor = Resources.RColors.validLabelColor
        } else {
            label.text = wrongMessage
            label.textColor = Resources.RColors.invalidLabelColor
        }
    }
    
    private func setPhoneNumberMask(on textField: UITextField,
                                    mask: String,
                                    string: String,
                                    range: NSRange) -> String {
        
        let text   = textField.text ?? ""
        return presenter.setupNumberMask(with: text,
                                  string: string,
                                  mask: mask,
                                  range: range)
    }
}


//MARK: - UITextFieldDelegate Extension

extension RegistrationController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
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
                                validType: .name,
                                validMessage: "Birthday is valid!",
                                wrongMessage: "Write a month!",
                                string: string,
                                range: range)
        case phoneField: phoneField.text = setPhoneNumberMask(on: phoneField,
                                                              mask: "+X (XXX) XXX-XX-XX",
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
