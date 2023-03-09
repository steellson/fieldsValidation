//
//  RegistrationPresenter.swift
//
//  Created by Steellson


import Foundation

//MARK: - RegistrationControllerProtocol

protocol RegistrationControllerProtocol: AnyObject {
    
}


//MARK: - RegistrationPresenterProtocol

protocol RegistrationPresenterProtocol: AnyObject {
    init(view: RegistrationControllerProtocol,
         userDefaultsManager: UserDefaultsManagerProtocol,
         router: RouterProtocol)
    
    func ageIsValid() -> Bool
    func setupNumberMask(with text: String,
                         string: String,
                         mask: String,
                         range: NSRange) -> String
    func goRegButtonDidTapped()
}


//MARK: - RegistrationPresenterImpl

final class RegistrationPresenter: RegistrationPresenterProtocol {
    
    //MARK: Variables
    
    private weak var view           : RegistrationControllerProtocol!
    private var userDefaultsManager : UserDefaultsManagerProtocol!
    private var router              : RouterProtocol!
    
    
    //MARK: - Init
    
    required init(view: RegistrationControllerProtocol,
                  userDefaultsManager: UserDefaultsManagerProtocol,
                  router: RouterProtocol) {
        
        self.view                = view
        self.userDefaultsManager = userDefaultsManager
        self.router              = router
    }
    
    
    //MARK: - Methods
    
    func ageIsValid() -> Bool {
        if let view = view as? RegistrationController {
            let calendar = NSCalendar.current
            let dateNow  = Date()
            let birthday = view.ageDatePicker.date
            
            let age      = calendar.dateComponents([.year], from: birthday, to: dateNow)
            let ageYear  = age.year
            
            guard let ageUser = ageYear else { return false }
            return (ageUser < 18 ? false : true)
        } else {
            print("Validation method error")
        }
        return false
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
//                && phoneText.isValid(validType: .phone)
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
                view.dismiss(animated: true)
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
