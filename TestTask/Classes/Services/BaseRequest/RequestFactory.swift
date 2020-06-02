//
//  RequestFactory.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

final class RequestFactory {
    
    static func getRequest(baseRequest: BaseRequest) -> URLRequest {
        
        let stringURL = baseRequest.baseURL + baseRequest.path + baseRequest.parameters.parametersString
        
        guard let encodedUrl = stringURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError("Can't encode url from \(stringURL)")
        }
        
        guard let url = URL(string: encodedUrl) else {
            fatalError("Can't create url from \(encodedUrl)")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = baseRequest.method
        request.allHTTPHeaderFields = baseRequest.headers
        
        return request
    }
}
