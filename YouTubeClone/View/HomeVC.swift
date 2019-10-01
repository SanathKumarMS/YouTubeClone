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
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.barStyle = .black
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: self.view.frame.width, height: height + 16 + 68)
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
        cell.titleLabel.text = "deadmau5 - Let Go Feat. Grabbitz (Cube 2.1)"
        cell.subtitleTextView.text = "deadmau5VEVO • 20,695,367 views • 16 Dec 2016"
        cell.subtitleTextView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        return cell
    }
    
}

