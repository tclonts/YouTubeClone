//
//  VideoController.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 11/18/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

class VideoController {
    
    static let shared = VideoController()
    
    let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
    
    var videos: [Video]?
    
    func fetchVideos() {

        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print("There was an error fetching videos: Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {return}
            
            do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                self.videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as! String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    video.channel = channel
                    
                    self.videos?.append(video)
                }
                
                
                
                
            }catch let jsonError{
                print(jsonError)
            }
        }.resume()
    }
    
    
    
}
