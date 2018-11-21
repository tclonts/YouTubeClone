//
//  UIImageVIewExtension.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 11/19/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

extension UIImageView {
    
    
    func loadImageUsingUrlString(urlString: String) {
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            }.resume()
        
        }
    }

