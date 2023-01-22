//
//  RegistrationController.swift
//
//  Created by Steellson


import UIKit


//MARK: - RegistrationController

final class RegistrationController: UIViewController {
    
    var presenter: AuthorizationPresenterProtocol!
    
    //MARK: - UI Elements
        
    let registrationTitle = UILabel(UIFont(name: "Helvetica-Bold", size: 30)!, .white, .center, "Registration")
    let fistNameField     = RegistrationFieldView(placeholder: "First Name")
    let secondNameField   = RegistrationFieldView(placeholder: "Second Name")
    let birthdayField     = RegistrationFieldView(placeholder: "Birthday")
    let phoneField        = RegistrationFieldView(placeholder: "Phone")
    let emailField        = RegistrationFieldView(placeholder: "Email")
    let passwordField     = RegistrationFieldView(placeholder: "Password")
    var signUpButton      = UIButton("SIGN-UP", .blue, .white)
    
    lazy var stackView = UIStackView([
        fistNameField, secondNameField, birthdayField, phoneField, emailField, passwordField, signUpButton
    ], .vertical, 20, .fillEqually)

    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
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
                
        view.addSubview(stackView)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)
    }
    
}

//MARK: - RegistrationControllerViewProtocol Extension

extension RegistrationController: AuthorizationControllerProtocol {
    func show() {
        
    }
}
