//
//  Video.swift
//  YouTubeClone
//
//  Created by Sanath Kumar M S on 03/10/19.
//  Copyright © 2019 Sanath Kumar M S. All rights reserved.
//

import UIKit

class Video: Decodable {
    var title: String?
    var thumbnailImageName: String?
    var numberOfViews: Int?
    var duration: Int?
    var channel: Channel?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case thumbnailImageName = "thumbnail_image_name"
        case numberOfViews = "number_of_views"
        case channel = "channel"
        case duration = "duration"
    }
}

class Channel: Decodable {
    var name: String?
    var profileImageName: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case profileImageName = "profile_image_name"
    }
}

//class Root: Decodable {
//   let videos: [Video]
//}
