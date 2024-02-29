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
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        
        let originalImage = UIImage(systemName: "chevron.down")
        let smallConfig = UIImage.SymbolConfiguration(scale: .small)
        let smallImage = originalImage?.withConfiguration(smallConfig)
        
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: smallImage, primaryAction: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let likedBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapLikedButton))
        
        let messageBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .plain, target: self, action: #selector(didTapMessageButton))
        
        return [messageBarButtonItem, likedBarButtonItem]
    }
    
    @objc func didTapLikedButton() {
        
    }
    
    @objc func didTapMessageButton() {
        
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Subscriptions", image: UIImage(systemName: "person.2.fill")) { _ in
            print("Subs")
        }
        
        let favsItem = UIAction(title: "Favorites", image: UIImage(systemName: "star.fill")) { _ in
            print("Favs")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

