//
//  HomeCollectionViewController.swift
//  YouTubeClone
//
//  Created by Tyler Clonts on 11/5/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit


class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video] = {
        
        var KayneChannel = Channel()
        KayneChannel.name = "KayneISTheBestChannel"
        KayneChannel.profileImageName = "kanye_profile"
        
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "AFork"
        blankSpaceVideo.channel = KayneChannel
        blankSpaceVideo.numberOfViews = 12324        
        return [blankSpaceVideo]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        navigationItem.titleView = titleLabel

        setupMenuBar()
        setupNavBarButtons()
    }


    let menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
       return mb
    }()
    private func setupMenuBar() {
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }
    
    private func setupNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        
        let navMoreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let navMoreIconBarButtonItem = UIBarButtonItem(image: navMoreImage, style: .plain, target: self, action: #selector(handleNavigation))
       
        navigationItem.rightBarButtonItems = [navMoreIconBarButtonItem, searchBarButtonItem]
    }
    
    @objc func handleSearch() {
        print(123)
    }
    
    @objc func handleNavigation() {
        print(123)
    }
    
    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! VideoCollectionViewCell
    
        cell.video = videos[indexPath.item]
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 88)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}
