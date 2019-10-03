//
//  SubscriptionsVC.swift
//  YouTubeClone
//
//  Created by Sanath Kumar M S on 03/10/19.
//  Copyright © 2019 Sanath Kumar M S. All rights reserved.
//

import UIKit

class SubscriptionsVC: BaseVC {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}


extension SubscriptionsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SubscriptionsCVCell.self), for: indexPath) as? SubscriptionsCVCell else { return SubscriptionsCVCell() }
        
        cell.shadowView.backgroundColor = .white
        cell.shadowView.layer.shadowColor = UIColor.gray.cgColor
        cell.shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.shadowView.layer.shadowOpacity = 0.5
        cell.shadowView.layer.shadowRadius = 8
        return cell
    }
    
    
}
