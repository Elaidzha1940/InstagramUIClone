//  /*
//
//  Project: InstagramUIClone
//  File: StoriesItemCell.swift
//  Created by: Elaidzha Shchukin
//  Date: 01.03.2024
//
//  */

import UIKit
import SnapKit

class StoriesItemCell: UICollectionViewCell {
    //MARK: Public
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
    }
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private constants
    private enum UIConstants {
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        static let cellHeight: CGFloat = 100
    }
    
    //MARK: Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
}

//MARK: Private methods

private extension StoriesItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
    }
}
