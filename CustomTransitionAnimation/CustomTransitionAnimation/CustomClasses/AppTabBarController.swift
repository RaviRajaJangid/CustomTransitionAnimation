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
        
        //View for shadow
        let viewOverTabBar = UIView(frame: CGRect(x: 0, y:UIScreen.main.bounds.height - (tabBar.frame.size.height), width: UIScreen.main.bounds.size.width, height: 50));
        tabBar.superview!.addSubview(viewOverTabBar)
        viewOverTabBar.addShadow(shadowOffset: CGSize(width: 0, height: -10))
        viewOverTabBar.backgroundColor = .green
        viewOverTabBar.layer.cornerRadius = 50
        tabBar.superview!.insertSubview(viewOverTabBar, at: 1)
    }

}
