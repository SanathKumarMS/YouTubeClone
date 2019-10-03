//
//  Video.swift
//  YouTubeClone
//
//  Created by Sanath Kumar M S on 03/10/19.
//  Copyright © 2019 Sanath Kumar M S. All rights reserved.
//

import UIKit

class Video {
    var title: String?
    var thumbnailImageName: String?
    var numberOfViews: Int?
    var uploadDate: String?
    var channel: Channel?
}

class Channel {
    var name: String?
    var profileImageName: String?
}
