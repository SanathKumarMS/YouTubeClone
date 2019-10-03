//
//  TrendingVC.swift
//  YouTubeClone
//
//  Created by Sanath Kumar M S on 03/10/19.
//  Copyright © 2019 Sanath Kumar M S. All rights reserved.
//

import UIKit

class TrendingVC: BaseVC {
    
    @IBOutlet weak var shadowView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: -5, height: 5)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 5
    }

}
