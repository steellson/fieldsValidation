//
//  AuthorizationPresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - AuthorizationControllerProtocol

protocol AuthorizationControllerProtocol: AnyObject {
    func show()
}


//MARK: - AuthorizationPresenterProtocol

protocol AuthorizationPresenterProtocol: AnyObject {
    init(view: AuthorizationControllerProtocol, userDefaultsManager: UserDefaultsManagerProtocol, router: AuthorizationRouterProtocol)
    func signInButtonDidTapped()
    func signUpButtonDidTapped(on view: AuthorizationControllerProtocol)
}


//MARK: - AuthorizationPresenter

final class AuthorizationPresenter: AuthorizationPresenterProtocol {
    
    //MARK: Variables
    
    weak var view           : AuthorizationControllerProtocol!
    var userDefaultsManager : UserDefaultsManagerProtocol!
    var router              : AuthorizationRouterProtocol!
    
    
    //MARK: - Init
    
    required init(view: AuthorizationControllerProtocol, userDefaultsManager: UserDefaultsManagerProtocol, router: AuthorizationRouterProtocol) {
        self.view                = view
        self.userDefaultsManager = userDefaultsManager
        self.router              = router
    }
    
    
    //MARK: - Methods
    
    func signInButtonDidTapped() {
        guard let controller = view as? LoginController else { return }
        
        let mail     = controller.emailField.text ?? ""
        let password = controller.passwordField.text ?? ""
        let user     = findUser(mail: mail)
        
        if user != nil  {
            controller.emailField.textColor = .systemGreen
            if user?.password == password {
                
                /////// PLACE FOR TRANSITION //////////
                
                print("Success login of \(user!)")
            } else {
                let alert  = AlertController(header: nil,
                                             message: Resources.Strings.loginAlertWrongMailOrPass.rawValue,
                                             actionPossibility: true)
                controller.present(alert, animated: true)
            }
        } else {
            controller.emailField.textColor = .red
            
            let alert  = AlertController(header: Resources.Strings.loginAlertUserNotFoundTitle.rawValue,
                                         message: Resources.Strings.loginAlertUserNotFound.rawValue,
                                         actionPossibility: true)
            controller.present(alert, animated: true)
            
        }
    }
    
    func signUpButtonDidTapped(on view: AuthorizationControllerProtocol) {
        if let _ = view as? LoginController {
            router.goToRegistration()
            
        } else if let view = view as? RegistrationController {
            let firstNameText  = view.firstNameLabel.text ?? ""
            let secondNameText = view.secondNameLabel.text ?? ""
            let phoneText      = view.phoneLabel.text ?? ""
            let emailText      = view.emailLabel.text ?? ""
            let passwordText   = view.passwordLabel.text ?? ""
            
            if firstNameText.isValid(validType: .name)
                && secondNameText.isValid(validType: .name)
                && phoneText.isValid(validType: .phone)
                && emailText.isValid(validType: .email)
                && passwordText.isValid(validType: .password) {
                
                userDefaultsManager.saveUser(firstName: firstNameText,
                                             secondName: secondNameText,
                                             phone: phoneText,
                                             age: view.ageDatePicker.date,
                                             email: emailText,
                                             password: passwordText)
            
                let alert  = AlertController(header: nil,
                                             message: Resources.Strings.registrationCompletedAlertMessage.rawValue,
                                             actionPossibility: true)
                view.present(alert, animated: true)
            } else {
                let alert  = AlertController(header: Resources.Strings.registrationWrongAlertTitle.rawValue,
                                             message: Resources.Strings.registrationWrongAlertMessage.rawValue,
                                             actionPossibility: true)
                view.present(alert, animated: true)
            }
        }
    }
    
}


//MARK: - AuthorizationPresenter Find User Exetnsion

extension AuthorizationPresenter {
    
    private func findUser(mail: String) -> User? {
        for user in userDefaultsManager.users {
            if user.email == mail {
                return user
            }
        }
        return nil
    }
}
