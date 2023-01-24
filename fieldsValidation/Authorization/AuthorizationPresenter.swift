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
                print("Password error")
            }
        } else {
            controller.emailField.textColor = .red
            print("Failed!")
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
                
                let alertMaster = AlertMaster(view: view)
                alertMaster.showAlert(with: "",
                                      alertMessage: Resources.Strings.registrationCompletedAlertMessage.rawValue,
                                      actionTitle: Resources.Strings.registrationCompletedActionTItle.rawValue)
            } else {
                let alertMaster = AlertMaster(view: view)
                alertMaster.showAlert(with: Resources.Strings.registrationWrongAlertTitle.rawValue,
                                      alertMessage: Resources.Strings.registrationWrongAlertMessage.rawValue,
                                      actionTitle: Resources.Strings.registrationTryAgainAction.rawValue)
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
