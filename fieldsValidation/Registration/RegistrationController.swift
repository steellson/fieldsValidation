//
//  RegistrationController.swift
//
//  Created by Steellson


import UIKit


//MARK: - RegistrationController

final class RegistrationController: UIViewController {
    
    
    //MARK: - UI Elements
    
    var stackView: UIStackView!
    
    let registrationTitle = UILabel(UIFont(name: "Arial", size: 25)!, .systemPink, .center, "Registration")
    let fistNameField     = RegistrationFieldView(placeholder: "First Name")
    let secondNameField   = RegistrationFieldView(placeholder: "Second Name")
    let birthdayField     = RegistrationFieldView(placeholder: "Birthday")
    let phoneField        = RegistrationFieldView(placeholder: "Phone")
    let emailField        = RegistrationFieldView(placeholder: "Email")
    let passwordField     = RegistrationFieldView(placeholder: "Password")
    var signUpButton      = UIButton("SignUP", .purple, .systemPink)
    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
    }
    
    private func setupStackView() {
        let arrangedSubbviews = [registrationTitle, fistNameField, secondNameField,
                                 birthdayField, phoneField, emailField, passwordField, signUpButton]
        
        stackView              = UIStackView(arrangedSubviews: arrangedSubbviews)
        stackView.axis         = .vertical
        stackView.spacing      = 10
        stackView.distribution = .fillEqually

        view.addSubview(stackView)
    }
    
    //MARK: - Button actions
    
    @objc func signUpButtonDidTapped() {
        print("tap")
    }

}


//MARK: - RegistrationController Extension

extension RegistrationController {
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.5557171106, green: 0.5678942204, blue: 0.7974012494, alpha: 1)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)
        
        setupStackView()
    }
    
}
