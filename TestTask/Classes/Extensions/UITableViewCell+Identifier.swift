//
//  UITableViewCell+Identifier.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
}
