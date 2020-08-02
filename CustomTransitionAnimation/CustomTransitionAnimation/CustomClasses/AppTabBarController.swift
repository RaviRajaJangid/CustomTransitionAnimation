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

        
        let view = UIView()
        view.addShadow(shadowOffset:  CGSize(width: 0, height: -8))
        //self.tabBar.addSubview(view)
        self.view.addSubview(view)
    }
    
    override func viewDidLayoutSubviews() {
        var f = self.tabBar.bounds
        f.origin.y = 300
        view.frame = f
        view.backgroundColor = .green
    }
}
