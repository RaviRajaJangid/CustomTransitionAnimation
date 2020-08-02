//
//  AppTabBarController.swift
//  CustomTransitionAnimation
//
//  Created by Ravi Raja Jangid on 01/08/20.
//  Copyright © 2020 Ravi Raja Jangid. All rights reserved.
//

import UIKit

class AppTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        let viewOverTabBar = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - tabBar.frame.size.height, width: UIScreen.main.bounds.width, height: 30));
//        tabBar.superview!.addSubview(viewOverTabBar)
//        viewOverTabBar.backgroundColor = .green
//        viewOverTabBar.layer.borderWidth = 1
//        viewOverTabBar.roundTopCorner(cornerRadius: 50)
//        tabBar.superview!.addSubview(viewOverTabBar)
//        viewOverTabBar.addShadow(shadowOffset: CGSize(width: 0, height: -4))
//        viewOverTabBar.clipsToBounds = false
//        tabBar.sendSubviewToBack(viewOverTabBar)
        tabBar.roundTopCorner(cornerRadius: 50)
        tabBar.clipsToBounds = false
        tabBar.addShadow(shadowOffset: CGSize(width: 0, height: -10))
    }

}
