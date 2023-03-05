//
//  APIManager.swift
//  fieldsValidation
//
//  Created by Andrey Pochepaev on 02.03.2023.
//

import Foundation

//MARK: - API Enums

enum APIError: Error {
    case decodeError
    case urlSessionTaskError
}

enum APIResult {
    case success(objects: [RequestedObject])
    case error(error: APIError)
}




//MARK: APIManager Protocol

protocol APIManagerProtocol: AnyObject {
    func getData(from url: String, completion: @escaping (APIResult) -> ())
}


//MARK: APIManagerImpl

final class APIManager {
    
    //    private let defaultURL = "https://api.kinopoisk.dev/v1/"
    //    private let apiToken = "2DZSKPA-6V5MMTW-MJWTGDM-QV2GGEY"
    
    func getData(from url: String, completion: @escaping (APIResult) -> Void) {
        
        guard let urlString = URL(string: url) else { return }
        let request = URLRequest(url: urlString)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: APIResult
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
                        
            if error == nil, let data = data {

                guard let objects = try? JSONDecoder().decode([RequestedObject].self, from: data) else {
                    return result = .error(error: .decodeError)
                }
                
                result = .success(objects: objects)
                
            } else {
                result = .error(error: .urlSessionTaskError)
            }
        }
        task.resume()
    }
    
}

//MARK: APIManager Protocol Extension

extension APIManager: APIManagerProtocol {
    
    
}
