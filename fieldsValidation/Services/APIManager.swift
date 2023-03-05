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
    case success(photos: Photo)
    case error(error: APIError)
}


//MARK: APIManager Protocol

protocol APIManagerProtocol: AnyObject {
    func getData(from url: String, completion: @escaping (APIResult) -> ())
}


//MARK: APIManagerImpl

final class APIManager {
    
   //defaultURL = "https://api.kinopoisk.dev/v1"
    
}

//MARK: APIManager Protocol Extension

extension APIManager: APIManagerProtocol {
    
    func getData(from url: String, completion: @escaping (APIResult) -> Void) {
        
        guard let urlString = URL(string: url) else { return }
        
        var request = URLRequest(url: urlString)
        request.httpMethod          = "GET"
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: APIResult
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
                        
            if error == nil, let data = data {

                guard let photos = try? JSONDecoder().decode(Photo.self, from: data) else {
                    return result = .error(error: .decodeError)
                }
                
                result = .success(photos: photos)
                
            } else {
                result = .error(error: .urlSessionTaskError)
            }
        }
        task.resume()
    }
    
}
