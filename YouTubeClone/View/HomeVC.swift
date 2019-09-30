//
//  HomeVC.swift
//  YouTubeClone
//
//  Created by Sanath Kumar M S on 30/09/19.
//  Copyright © 2019 Sanath Kumar M S. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {
    @IBOutlet private weak var collectionView: UICollectionView!
}

// MARK: - UICollectionViewDelegate

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCVCell.self), for: indexPath) as? HomeCVCell else { return HomeCVCell() }
        
        cell.thumbnailImageView.backgroundColor = .gray
        cell.profileImageView.backgroundColor = .lightGray
        cell.titleLabel.backgroundColor = .purple
        cell.subtitleTextView.backgroundColor = .red
        return cell
    }
    
}

