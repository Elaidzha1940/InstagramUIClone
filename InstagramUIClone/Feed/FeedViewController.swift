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
    
    //MARK: Private properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "eli")!, userName: "eli", isAddButtonVisibale: true, isNewStories: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "eli1")!, userName: "elaidzha", isAddButtonVisibale: false, isNewStories: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "eli")!, userName: "eli", isAddButtonVisibale: false, isNewStories: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "eli1")!, userName: "elaidzha", isAddButtonVisibale: false, isNewStories: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "eli")!, userName: "eli", isAddButtonVisibale: false, isNewStories: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "eli1")!, userName: "elaidzha", isAddButtonVisibale: false, isNewStories: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "eli1")!, userName: "eli", isAddButtonVisibale: false, isNewStories: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "eli")!, userName: "elaidzha", isAddButtonVisibale: false, isNewStories: true),
        ]),
        .posts(FeedPostItemInfo(userImage: UIImage(named: "eli1")!, userName: "shchukin", postSubtitle: "Sponsored", postImage: UIImage(named: "eli1")!, numberOfLikes: 828, comment: CommentShortInfo(userName: "Elaidzha_Shchukin", commentText: "Good luck, buddy!")))
    ]
}

//MARK: Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
        let likedBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart"), style: .plain, target: self, action: #selector(didTapLikedButton))
        
        let messageBarButtonItem = UIBarButtonItem(image: UIImage(named: "message"), style: .plain, target: self, action: #selector(didTapMessageButton))
        
        return [messageBarButtonItem, likedBarButtonItem]
    }
    
    @objc func didTapLikedButton() {
        print("liked")
    }
    
    @objc func didTapMessageButton() {
        print("message")
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

//MARK: UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
        case .posts(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
