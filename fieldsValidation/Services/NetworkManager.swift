//
//  NetworkManager.swift
//  fieldsValidation
//
//  Created by Andrey Pochepaev on 02.03.2023.
//

import Foundation

//MARK: - Enums

enum HTTPMethod: String {
    case GET
    case POST
    case DELETE
}

enum RequestResult {
    case success(items: Any)
    case error(error: RequestError)
}

enum RequestError: Error {
    case decodeError
    case urlSessionTaskError
}


//MARK: NetworkManagerProtocol

protocol NetworkManagerProtocol: AnyObject {
    
    func getData<T: Decodable>(from url: String,
                               method: HTTPMethod?,
                               model: T,
                               completion: @escaping (RequestResult) -> Void)
}


//MARK: NetworkManagerImpl

final class NetworkManager { }



//MARK: NetworkManager Protocol Extension

extension NetworkManager: NetworkManagerProtocol {
    
    func getData<T: Decodable>(from url: String,
                 method: HTTPMethod?,
                 model: T,
                 completion: @escaping (RequestResult) -> Void) {
        
        guard let urlString = URL(string: url) else { return }
        
        var request = URLRequest(url: urlString)
        request.httpMethod = method?.rawValue ?? "GET"
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            var result: RequestResult
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
                        
            if error == nil, let data = data {

                guard let items = try? JSONDecoder().decode(T.self, from: data) else {
                    return result = .error(error: .decodeError)
                }
                
                result = .success(items: items)
                
            } else {
                result = .error(error: .urlSessionTaskError)
            }
        }
        task.resume()
    }
    
}
