//
//  User.swift
//  fieldsValidation
//
//  Created by Andrey Pochepaev on 24.01.2023.
//

import Foundation

//MARK: - User Model

struct User: Codable {
    let firstName  : String
    let secondName : String
    let age        : Date
    let phone      : String
    let email      : String
    let password   : String
}
