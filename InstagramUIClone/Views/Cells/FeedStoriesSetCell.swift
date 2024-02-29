//  /*
//
//  Project: InstagramUIClone
//  File: FeedStoriesSetCell.swift
//  Created by: Elaidzha Shchukin
//  Date: 01.03.2024
//
//  */

import UIKit
import SnapKit

class FeedStoriesSetCell: UITableViewCell {
    //MARK: Public
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private properties
    private var collectionView: UICollectionView!

    
    //MARK: Init
    func configure(with info: FeedStoriesCellInfo) {
        
    }
}

//MARK: Private methods
private extension FeedStoriesSetCell {
    func initialize() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
    }
}
