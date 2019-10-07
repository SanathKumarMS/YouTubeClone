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
    @IBOutlet weak var slideInMenuCollectionView: UICollectionView!
    private var viewModel = HomeVM()
    let blackView = UIView()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.navigationItem.title = "Home"
        self.navigationItem.title = "Home"
        navigationController?.navigationBar.barStyle = .black
        collectionView.delaysContentTouches = false
        viewModel.fetchVideos { [weak self] (isSuccess) in
            if isSuccess == true {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
        setupUI()
    }
    
    @IBAction func handleMore(_ sender: Any) {
        print("Handle More")
        if let window = UIApplication.shared.keyWindow {
           
            window.addSubview(blackView)
//            window.willMove(toSuperview: blackView)
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
                self.slideInMenuCollectionView.frame = CGRect(x: 0, y: self.view.frame.height - 400, width: self.slideInMenuCollectionView.frame.width, height: 400)
            }
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            self.slideInMenuCollectionView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.slideInMenuCollectionView.frame.width, height: 0)
        }
    }
    
    func setupUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismiss))
        blackView.addGestureRecognizer(tap)
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.frame = view.bounds
        blackView.alpha = 0
        slideInMenuCollectionView.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: 0)
    }
    
    
}

// MARK: - UICollectionViewDelegate

extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeCVCell else { return }
        cell.backgroundColor = .red
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeCVCell else { return }
        cell.backgroundColor = .white
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: self.view.frame.width, height: height + 16 + 80)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.videos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCVCell.self), for: indexPath) as? HomeCVCell else { return HomeCVCell() }
        
        cell.thumbnailImageView.backgroundColor = .gray
        cell.profileImageView.backgroundColor = .lightGray
        cell.titleLabel.text = viewModel.videos[indexPath.item].title
        if let channelName = viewModel.videos[indexPath.item].channel?.name {
            cell.subtitleTextView.text = channelName
        }
        if let profileImageName = viewModel.videos[indexPath.item].channel?.profileImageName {
            cell.profileImageView.loadImageWithURL(urlString: profileImageName)
        }
        return cell
    }
    
}

