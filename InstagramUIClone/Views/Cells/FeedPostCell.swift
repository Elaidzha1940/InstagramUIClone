//  /*
//
//  Project: InstagramUIClone
//  File: FeedPostCell.swift
//  Created by: Elaidzha Shchukin
//  Date: 01.03.2024
//
//  */

import UIKit
import SnapKit

class FeedPostCell: UITableViewCell {
    //MARK: Public
    func configure(with info: FeedPostItemInfo) {
        
    }
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private constants
    private enum UIConstants {
        static let userImageSize: CGFloat = 35
        static let cellWidth: CGFloat = 75
        static let cellHeight: CGFloat = 100
    }
    
    //MARK: Private properties
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
}

// MARK: Private methods
private extension FeedPostCell {
    func initialize() {
        
    }
}


