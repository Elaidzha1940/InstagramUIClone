//  /*
//
//  Project: InstagramUIClone
//  File: LogoView.swift
//  Created by: Elaidzha Shchukin
//  Date: 29.02.2024
//
//  */

import UIKit
import SnapKit

class LogoView: UIView {
    //MARK: Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private constants
    private enum UIConstants {
        static let LogoWidth: CGFloat = 125
        static let LogoHeight: CGFloat = 40
    }
    
    //MARK: Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cinsta")
        return view
    }()
}

//MARK: Private methods

private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstants.LogoWidth)
            make.height.equalTo(UIConstants.LogoHeight)
        }
    }
}
