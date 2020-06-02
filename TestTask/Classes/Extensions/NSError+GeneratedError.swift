//
//  NSError+GeneratedError.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

extension NSError {
    
    static func innerError(localizedDescription: String) -> NSError {
        return NSError(domain: LOC("generated_error"), code: 999, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
    
    static func serverError(code: Int, errorData: [String: Any]? = nil) -> NSError {
        
        let localizedDescription: String
        if code >= 500 {
            localizedDescription = LOC("server_error")
        } else {
            localizedDescription = LOC("make_request_fail")
        }
        
        return NSError(domain: LOC("generated_error"), code: code, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    }
}
