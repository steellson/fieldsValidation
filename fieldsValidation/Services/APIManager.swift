//
//  APIManager.swift
//  fieldsValidation
//
//  Created by Andrey Pochepaev on 02.03.2023.
//

import Foundation


//MARK: APIManager Protocol

protocol APIManagerProtocol: AnyObject {
    func getData(from url: String, completion: @escaping (Result<[RequestedObject], Error>) -> ())
}


//MARK: APIManagerImpl

final class APIManager {
    
    private let defaultURL = "https://api.kinopoisk.dev/v1/"
    private let apiToken = "2DZSKPA-6V5MMTW-MJWTGDM-QV2GGEY"
    
}

//MARK: APIManager Protocol Extension

extension APIManager: APIManagerProtocol {
    
    func getData(from url: String, completion: @escaping (Result<[RequestedObject], Error>) -> ()) {
        
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else { return }
            
            let objects = try! JSONDecoder().decode([RequestedObject].self, from: data)
            completion(.success(objects))
            
        }.resume()
    }
    
}
