//
//  AuthorizationPresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - AuthorizationControllerProtocol

protocol AuthorizationControllerProtocol: AnyObject {
    func enterButtonDidTapped()
}


//MARK: - AuthorizationPresenterProtocol

protocol AuthorizationPresenterProtocol: AnyObject {
    init(view: AuthorizationControllerProtocol,
         userDefaultsManager: UserDefaultsManagerProtocol,
         router: AuthorizationRouterProtocol)
    
    func findUser(by mail: String) -> User?
    
    func signInButtonDidTapped()
    func signUpButtonDidTapped()
    
    func setupNumberMask(with text: String,
                         string: String,
                         mask: String,
                         range: NSRange) -> String
    func goRegButtonDidTapped()
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
    
    func findUser(by mail: String) -> User? {
        for user in userDefaultsManager.users {
            if user.email == mail {
                print("Success!")
                return user
            }
        }
        return nil
    }
    
    func signInButtonDidTapped() {
        view.enterButtonDidTapped()
    }
    
    func signUpButtonDidTapped() {
        router.goToRegistration()
    }
    
    func goRegButtonDidTapped() {
        if let view = view as? RegistrationController {
            let firstNameText  = view.firstNameField.text ?? ""
            let secondNameText = view.secondNameField.text ?? ""
            let phoneText      = view.phoneField.text ?? ""
            let emailText      = view.emailField.text ?? ""
            let passwordText   = view.passwordField.text ?? ""
            
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
    
    
    func setupNumberMask(with text: String,
                         string: String,
                         mask: String,
                         range: NSRange) -> String {
        
        let phone  = (text as NSString).replacingCharacters(in: range, with: string)
        let number = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index  = number.startIndex
        
        for char in mask where index < number.endIndex {
            if char == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(char)
            }
        }
        return result
    }
}
