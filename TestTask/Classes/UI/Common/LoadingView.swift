//
//  LoadingView.swift
//  TestTaskMCT
//
//  Created by Igor on 01/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

final class LoadingView: UIView {
    
    private lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activity.startAnimating()
        activity.hidesWhenStopped = false
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    
    // MARK: - LyfeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: - Functions
    
    private func setup() {
        
        backgroundColor = .white
        alpha = 0.6
        
        addSubview(activity)
        activity.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activity.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
