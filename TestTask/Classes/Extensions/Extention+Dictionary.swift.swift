//
//  Extention+Dictionary.swift.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

extension Dictionary where Key: StringProtocol, Value: StringProtocol {
    
    var parametersString: String {
        guard !self.isEmpty else { return "" }
        
        var resultString = ""
        self.forEach {
            let valueString = String(describing: $0.value).replacingOccurrences(of: ",", with: "%2C")
            let string = String(describing: $0.key) + "=" + valueString + "&"
            resultString.append(string)
        }
        
        return "?" + resultString.dropLast()
    }
}
