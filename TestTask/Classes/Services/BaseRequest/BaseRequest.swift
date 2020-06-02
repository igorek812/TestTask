//
//  BaseRequest.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

class BaseRequest {
    
    var method: String {
        return "GET"
    }
    
    var baseURL: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        return ""
    }
    
    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    var parameters: [String: String] {
        return [:]
    }
    
    var json: [String: Any] {
        return [:]
    }
}
