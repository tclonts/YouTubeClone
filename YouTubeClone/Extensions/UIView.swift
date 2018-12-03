//
//  UIView.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 11/7/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
          addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views:viewsDictionary))
        
    }
    
    
}
