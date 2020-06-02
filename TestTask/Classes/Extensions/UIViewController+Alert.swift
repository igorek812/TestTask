//
//  UIViewController+Alert.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String? = nil, message: String = LOC("error")) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        if let presentedVC = presentedViewController {
            presentedVC.present(alertController, animated: true, completion: nil)
        } else {
            present(alertController, animated: true, completion: nil)
        }
    }
}
