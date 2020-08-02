//
//  UIFont+Extension.swift
//  CustomTransitionAnimation
//
//  Created by Ravi Raja Jangid on 31/07/20.
//  Copyright © 2020 Ravi Raja Jangid. All rights reserved.
//
import UIKit

extension UIFont {
    
    // MARK: - Custom Fonts
    
    public enum FontType: String {
        case light = "-Light"
        case regular = "-Regular"
        case bold = "-Bold"
        case medium = "-Medium"
    }

    static func Ubantu(_ type: FontType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        
        return UIFont(name: "Ubuntu" + type.rawValue, size: size)!
    
    }

}

