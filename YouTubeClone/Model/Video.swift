//
//  Video.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 11/11/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSData?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    
    
    var name: String?
    var profileImageName: String?
    
}
