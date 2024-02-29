//  /*
//
//  Project: InstagramUIClone
//  File: FeedPostItemInfo.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.02.2024
//
//  */

import UIKit
import SnapKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let userName: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let userName: String
    let commentText: String
}
