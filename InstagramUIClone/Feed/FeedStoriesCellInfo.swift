//  /*
//
//  Project: InstagramUIClone
//  File: FeedStoriesCellInfo.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.02.2024
//
//  */

import UIKit
import SnapKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let userName: String
    let isAddButtonVisibale: Bool
    let isNewStories: Bool
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
