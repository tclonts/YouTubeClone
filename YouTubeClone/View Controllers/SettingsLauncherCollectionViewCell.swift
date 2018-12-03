//
//  SettingsLauncherCollectionViewCell.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 12/2/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class SettingsLauncherCollectionViewCell: BaseCell {
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Settings"
        label.textColor = UIColor.black
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(nameLabel)
        
        addSubview(iconImageView)
        addConstraintsWithFormat(format:"H:|-8-[v0(30)]-8-[v1]|", views: iconImageView, nameLabel)
        
        addConstraintsWithFormat(format:"V:|[v0]|", views: nameLabel)
        
        addConstraintsWithFormat(format:"V:[v0(30)]", views: iconImageView)
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
    }
    
    
}
