//
//  UserDefaultsManager.swift
//  Created by Steellson
//

import Foundation

//MARK: - UserDefaultsManager Protocol

protocol UserDefaultsManagerProtocol: AnyObject {
    var users: [User] { get set }
    func saveUser(firstName: String,
                  secondName: String,
                  phone: String,
                  age: Date,
                  email: String,
                  password: String)
}


//MARK: - UserDefaultsManagerImpl

final class UserDefaultsManager {
    
    //MARK: - UDKeys Enum
    
    enum UDKeys: String {
        case users
    }
    
    //MARK: - Variables
    
    private let defaults = UserDefaults.standard
    private let userKey  = UDKeys.users.rawValue
    
}


//MARK: - UserDefaultsManager Protocol Extension

extension UserDefaultsManager: UserDefaultsManagerProtocol {
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: userKey)
            }
        }
    }
    
    func saveUser(firstName: String,
                  secondName: String,
                  phone: String,
                  age: Date,
                  email: String,
                  password: String) {
        
        let user = User(firstName: firstName,
                        secondName: secondName,
                        age: age,
                        phone: phone,
                        email: email,
                        password: password)
        
        users.insert(user, at: 0)
    }
}

