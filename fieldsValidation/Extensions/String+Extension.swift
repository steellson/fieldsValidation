//
//  String+Extension.swift
//

import Foundation

extension String {
    
    //MARK: - RegExp Checking
    
    enum ValidTypes {
        case name
        case secondName
      //  case phone
        case email
        case password
    }
    
    enum RegExp: String {
        case name      = "[a-zA-Z]{1,}"
       // case phone     = "[0-9]"
        case email     = "[a-zA-Z0-9._]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}"
        case password  = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,16}"
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regexp = ""
        
        switch validType {
        case .name:
            regexp = RegExp.name.rawValue
        case .secondName:
            regexp = RegExp.name.rawValue
//        case .phone:
//            regexp = RegExp.phone.rawValue
        case .email:
            regexp = RegExp.email.rawValue
        case .password:
            regexp = RegExp.password.rawValue
        }
        
        return NSPredicate(format: format, regexp).evaluate(with: self)
    }

}
