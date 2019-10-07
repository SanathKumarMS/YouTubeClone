//
//  HomeVM.swift
//  YouTubeClone
//
//  Created by Sanath Kumar M S on 03/10/19.
//  Copyright © 2019 Sanath Kumar M S. All rights reserved.
//

import UIKit
import Alamofire

class HomeVM: BaseVM {
    var videos: [Video] = []
    var fetchURL = "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"
    
    func fetchVideos(completionHandler: @escaping (Bool) -> Void) {
        Alamofire.request(fetchURL).responseJSON { [weak self] (data) in
            if data.result.value != nil {
                guard let jsonData = data.data else {
                    completionHandler(false)
                    return
                }
                
                do {
                    let root = try JSONDecoder().decode(Array<Video>.self, from: jsonData)
                    self?.videos = root
                    completionHandler(true)
                } catch let jsonError{
                    print(jsonError)
                    completionHandler(false)
                }
            }
        }
        
    }
}
