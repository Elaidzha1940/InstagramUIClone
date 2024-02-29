//  /*
//
//  Project: InstagramUIClone
//  File: FeedViewController.swift
//  Created by: Elaidzha Shchukin
//  Date: 28.02.2024
//
//  */

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

//MARK: Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .gray
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makedropDownMenu())
        return [dropDownButtonItem]
    }
    
    func makedropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Subscriptions", image: UIImage(systemName: "person.2.fill")) { _ in
            print("Subs")
        }
        
        let favsItem = UIAction(title: "Favorites", image: UIImage(systemName: "star.fill")) { _ in
            print("Favs")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}
