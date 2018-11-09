//
//  videoCollectionViewCell.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 11/7/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbNailImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.red
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    
    let separatorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    func setupViews() {
        
        
        addSubview(thumbNailImageVIew)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbNailImageVIew)
        
        // Horizontal
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // Vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbNailImageVIew, userProfileImageView, separatorView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        // Title Constraints
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbNailImageVIew, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbNailImageVIew, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        // SubtitleTextView Constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbNailImageVIew, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

