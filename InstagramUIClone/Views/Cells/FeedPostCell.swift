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
        userImageView.image = info.userImage
        userNameLabel.text = info.userName
        subtitleLabel.text = info.userName
        postImageView.image = info.userImage
        likesLabel.text = "\(info.numberOfLikes) Likes"
        if let comment = info.comment {
            configureCommentLabel(with: comment)
        }
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
        static let userImageSize: CGFloat = 40
        static let contentInset: CGFloat = 14
        static let userImageTopInset: CGFloat = 6
        static let userNameStackProfileImageOffset: CGFloat = 12
        static let postImageToUserImageOffset: CGFloat = 6
        static let actionStackHeight: CGFloat = 24
        static let actionStackToPostImageOffset: CGFloat = 12
        static let actionsStackSpacing: CGFloat = 12
        static let actionsStackToLikesLabelOffset: CGFloat = 12
        static let commentToLikesOffset: CGFloat = 12
    }
    
    //MARK: Private properties
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBackground
        if let image = UIImage(systemName: "ellipsis") {
            let tintedImage = image.withTintColor(.label, renderingMode: .alwaysOriginal)
            button.setImage(tintedImage, for: .normal)
        }
        return button
    }()
    
    private let postImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        if let image = UIImage(named: "cheart") {
            let tintedImage = image.withTintColor(.label, renderingMode: .alwaysOriginal)
            button.setImage(tintedImage, for: .normal)
        }
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        if let image = UIImage(named: "cmessage") {
            let tintedImage = image.withTintColor(.label, renderingMode: .alwaysOriginal)
            button.setImage(tintedImage, for: .normal)
        }
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        if let image = UIImage(named: "paperplane") {
            let tintedImage = image.withTintColor(.label, renderingMode: .alwaysOriginal)
            button.setImage(tintedImage, for: .normal)
        }
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
}

// MARK: Private methods
private extension FeedPostCell {
    func initialize() {
        selectionStyle = .none
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview().inset(UIConstants.userImageTopInset)
            make.size.equalTo(UIConstants.userImageSize)
        }
        
        let userNameStack = UIStackView()
        userNameStack.axis = .vertical
        userNameStack.addArrangedSubview(userNameLabel)
        userNameStack.addArrangedSubview(subtitleLabel)
        contentView.addSubview(userNameStack)
        userNameStack.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.userNameStackProfileImageOffset)
        }
        
        contentView.addSubview(optionsButton)
        optionsButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(UIConstants.contentInset)
        }
        
        contentView.addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(UIConstants.postImageToUserImageOffset)
            make.height.equalTo(contentView.snp.width)
        }
        
        let actionStack = UIStackView()
        actionStack.axis = .horizontal
        actionStack.addArrangedSubview(likeButton)
        actionStack.addArrangedSubview(commentButton)
        actionStack.addArrangedSubview(shareButton)
        actionStack.spacing = UIConstants.actionsStackSpacing
        contentView.addSubview(actionStack)
        actionStack.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.actionStackHeight)
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionStackToPostImageOffset)
        }
        
        contentView.addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(actionStack.snp.bottom).offset(UIConstants.actionsStackToLikesLabelOffset)
        }
        
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(likesLabel.snp.bottom).offset(UIConstants.commentToLikesOffset)
            make.bottom.equalToSuperview().inset(UIConstants.contentInset)
        }
    }
    
    func configureCommentLabel(with comment: CommentShortInfo) {
        let string = comment.userName + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.userName.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15, weight: .bold), range: range)
        commentLabel.attributedText = attributedString
    }
}


