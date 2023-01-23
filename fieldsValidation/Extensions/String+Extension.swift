//
//  String+Extension.swift
//

import Foundation

extension String {
    
    //MARK: - RegExp Checking
    
    enum ValidTypes {
        case name
        case secondName
        case birthDate
        case phone
        case email
        case password
    }
    
    enum RegExp: String {
        case name = "[a-zA-Z]{1,}"
        case birthDate
        case phone
        case email
        case password
    }
    
    func isValid(validType: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regexp = ""
        
        switch validType {
        case .name:
            regexp = RegExp.name.rawValue
        case .secondName:
            regexp = RegExp.name.rawValue
        case .birthDate:
            regexp = RegExp.birthDate.rawValue
        case .phone:
            regexp = RegExp.phone.rawValue
        case .email:
            regexp = RegExp.email.rawValue
        case .password:
            regexp = RegExp.password.rawValue
        }
        
        return NSPredicate(format: format, regexp).evaluate(with: self)
    }

}
