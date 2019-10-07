//
//  HomeCVCell.swift
//  YouTubeClone
//
//  Created by Sanath Kumar M S on 30/09/19.
//  Copyright © 2019 Sanath Kumar M S. All rights reserved.
//

import UIKit

class HomeCVCell: BaseCVCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.shadowColor = UIColor.gray.cgColor
        thumbnailImageView.layer.shadowOffset = CGSize(width: 20, height: 20)
        thumbnailImageView.layer.shadowOpacity = 0.5
        thumbnailImageView.layer.shadowRadius = 5
        subtitleTextView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
    }
}
