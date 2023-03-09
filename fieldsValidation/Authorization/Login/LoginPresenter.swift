//
//  LoginPresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - LoginControllerProtocol

protocol LoginControllerProtocol: AnyObject {
    
}


//MARK: - LoginPresenterProtocol

protocol LoginPresenterProtocol: AnyObject {
    init(view: LoginControllerProtocol,
         userDefaultsManager: UserDefaultsManagerProtocol,
         router: RouterProtocol)
    
    func findUser(by mail: String) -> User?
    func signInButtonDidTapped()
    func signUpButtonDidTapped()
}


//MARK: - AuthorizationPresenter

final class LoginPresenter: LoginPresenterProtocol {
    
    //MARK: Variables
    
    private weak var view           : LoginControllerProtocol!
    private var userDefaultsManager : UserDefaultsManagerProtocol!
    private var router              : RouterProtocol!
    
    
    //MARK: - Init
    
    required init(view: LoginControllerProtocol,
                  userDefaultsManager: UserDefaultsManagerProtocol,
                  router: RouterProtocol) {
        
        self.view                = view
        self.userDefaultsManager = userDefaultsManager
        self.router              = router
    }
    
    
    //MARK: - Methods
    
    func findUser(by mail: String) -> User? {
        for user in userDefaultsManager.users {
            if user.email.lowercased() == mail.lowercased() {
                return user
            }
        }
        return nil
    }
    
    func signInButtonDidTapped() {
        if let view = view as? LoginController {
            let mail     = view.emailField.text ?? ""
            let password = view.passwordField.text ?? ""
            let user     = view.presenter.findUser(by: mail)
            
            if user != nil  {
                view.emailField.textColor = .systemGreen
                if user?.password == password {
                    router.goHome()
                    print("Success login of \(user!)")
                } else {
                    let alert  = AlertController(header: nil,
                                                 message: Resources.Strings.loginAlertWrongMailOrPass.rawValue,
                                                 actionPossibility: true)
                    view.present(alert, animated: true)
                }
            } else {
                view.emailField.textColor = .red
                
                let alert  = AlertController(header: Resources.Strings.loginAlertUserNotFoundTitle.rawValue,
                                             message: Resources.Strings.loginAlertUserNotFound.rawValue,
                                             actionPossibility: true)
                view.present(alert, animated: true)
                
            }
        } else {
            print("SignIn button error")
        }
    }
    
    func signUpButtonDidTapped() {
        router.goToRegistration()
    }
}
