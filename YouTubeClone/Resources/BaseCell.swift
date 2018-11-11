//
//  BaseCell.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 11/10/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit


class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
