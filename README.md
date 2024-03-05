Instagram-UI-Clone.
===================

Welcome to InstagramUIClone, a project aimed at replicating the UI of Instagram using UIKit and SnapKit.
-------------------

dddddd

Introduction:
-------------
- This project is a full UIKit implementation, leveraging SnapKit for 100% programmatic UI layout.

Features:
---------
- NavigationBar: Explore the navigation bar setup.
- TableView: Dive into creating dynamic table views.
- Carousel: Implement a carousel view for dynamic content.
- Story Cell: Learn to create a cell layout for Instagram stories.
- Post Cell: Develop a post cell layout for Instagram-like posts.

Getting Started:
----------------
- To get started with this project, simply clone the repository and explore the codebase. Feel free to experiment and customize the UI elements to your liking!

Requirements:
-------------
- Xcode 12+
- Swift 5.0+
- iOS 12+

Installation:
-------------
- To install InstagramUIClone, follow these steps:

- Clone the repository to your local machine.
- Open the project in Xcode.
- Build and run the project on a simulator or device.    

-------------

UIButton with an ellipsis icon and a background color matching the system background color:
-------
```````ruby
   private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBackground
        if let image = UIImage(systemName: "ellipsis") {
            let tintedImage = image.withTintColor(.label, renderingMode: .alwaysOriginal)
            button.setImage(tintedImage, for: .normal)
        }
        return button
    }()
```````
-------
