//
//  Extensions.swift
//  YouTubeClone
//
//  Created by Sanath Kumar M S on 03/10/19.
//  Copyright © 2019 Sanath Kumar M S. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

let cache = NSCache<NSString, AnyObject>()

extension UIImageView {
    
    func loadImageWithURL(urlString: String) {
        self.image = nil
        
        if let cachedImage = cache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        guard  let url = URL(string: urlString) else {
            return
        }
        
        Alamofire.request(url).responseData { (data) in
            if let data = data.result.value {
                if let downloadedImage = UIImage(data: data) {
                    cache.setObject(downloadedImage, forKey: urlString as NSString)
                    DispatchQueue.main.async {
                        self.image = downloadedImage
                    }
                }
            }
        }
    }
    
}
