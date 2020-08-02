//
//  Tab.swift
//  CustomTransitionAnimation
//
//  Created by Ravi Raja Jangid on 30/07/20.
//  Copyright © 2020 Ravi Raja Jangid. All rights reserved.
//

import UIKit

///CustomTabBar class  to create rounded tabbar with custom height
class CustomTabBar: UITabBar {
 
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        roundTopCorner(cornerRadius: 50)
        let newBarHeight:CGFloat = 65
        var size = super.sizeThatFits(size)
        size.height = newBarHeight
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let bottomPadding = window?.safeAreaInsets.bottom
            size.height = newBarHeight + (bottomPadding ?? 0.0)
        }
        return size
     }
}
