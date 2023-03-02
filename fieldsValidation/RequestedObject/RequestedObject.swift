//
//  RequestedObject.swift
//  fieldsValidation
//
//  Created by Andrey Pochepaev on 02.03.2023.
//

import Foundation

//MARK: - RequestedObject Model

struct RequestedObject: Codable {
    let image: String
    let title: String
    let lenght: Int
    let date: Date
}


