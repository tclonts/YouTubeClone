//
//  videoCollectionViewCell.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 11/7/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: BaseCell {
    
    var video: Video? {
        didSet {
            guard let image = video?.thumbnailImageName else { return }
            guard let profileImageName = video?.channel?.profileImageName else { return }
//            guard let subtitleTextViews = video?.channel?.name else { return }
            guard let channelName = video?.channel?.name else { return }
            guard let numberOfViews = video?.numberOfViews else { return }
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            let subTitleText = "\(channelName) • \(numberFormatter.string(from: numberOfViews)!) • 2 years ago"
            
            titleLabel.text = video?.title
            thumbNailImageVIew.image = UIImage(named: image)
            userProfileImageView.image = UIImage(named: profileImageName)
            
            subtitleTextView.text = subTitleText
            
            // Measure Title Text
            if let title = video?.title {
            let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
             
                if estimatedRect.size.height > 20 {
                    titleLableHeightConstraint?.constant = 44
                } else  {
                    titleLableHeightConstraint?.constant = 20
                }
                
                
            }
        }
    }
    
    let thumbNailImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "AFork")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.image = UIImage(named: "profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
    return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "TaylorSwiftVEVO • 1,604,607 view • 2 years ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = UIColor.lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    
    let separatorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLableHeightConstraint: NSLayoutConstraint?
    
    override func setupViews() {
        
        addSubview(thumbNailImageVIew)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbNailImageVIew)
        
        // Horizontal
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // Vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbNailImageVIew, userProfileImageView, separatorView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        // Title Constraints
        
        // Top Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbNailImageVIew, attribute: .bottom, multiplier: 1, constant: 8))
        // Left Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        // Right Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbNailImageVIew, attribute: .right, multiplier: 1, constant: 0))
        // Height Constraint
        titleLableHeightConstraint = (NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44))
        addConstraint(titleLableHeightConstraint!)
        
        // SubtitleTextView Constraints
        
        // Top Constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        // Left Constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        // Right Constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbNailImageVIew, attribute: .right, multiplier: 1, constant: 0))
        // Height Constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
    }
}

