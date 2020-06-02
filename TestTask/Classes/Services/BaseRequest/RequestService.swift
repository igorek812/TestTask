//
//  RequestService.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

enum Result<T: Codable> {
    case success(T)
    case failure(Error)
}

class RequestService<T: Codable> {
    
    enum PerformResult {
        case success(Data)
        case failure(Error)
    }
    
    func process(request: URLRequest, completion: @escaping (Result<T>) -> Void) {
        perform(request: request) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let result = try decoder.decode(T.self, from: data)
                        completion(.success(result))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func perform(request: URLRequest, completion: @escaping (PerformResult) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                completion(.failure(err))
            } else if let response = response as? HTTPURLResponse, let data = data {
                if (200..<300).contains(response.statusCode) {
                    completion(.success(data))
                } else {
                    completion(.failure(NSError.serverError(code: response.statusCode)))
                }
            } else {
                completion(.failure(NSError.innerError(localizedDescription: LOC("generated_error"))))
            }
            }.resume()
    }
}
