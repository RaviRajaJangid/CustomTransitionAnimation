//
//  UIView.swift
//  CustomTransitionAnimation
//
//  Created by Ravi Raja Jangid on 30/07/20.
//  Copyright © 2020 Ravi Raja Jangid. All rights reserved.
//
import UIKit

extension UIView {
    func addShadow(shadowOffset: CGSize) {
            self.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowRadius = 8
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = UIScreen.main.scale
        }
    
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor, cornerRadius: CGFloat = 0.0) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.cornerRadius = cornerRadius
        clipsToBounds = true
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    ///This will round view top left, right corner only
    func roundTopCorner(cornerRadius:CGFloat){
        if #available(iOS 11.0, *) {
               self.clipsToBounds = true
               self.layer.cornerRadius = cornerRadius
               self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
           } else {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.topLeft , .topRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
        }
    }
    
    ///This will round view top left, right corner only
    func roundBottomCorner(cornerRadius:CGFloat){
        if #available(iOS 11.0, *) {
               self.clipsToBounds = true
               self.layer.cornerRadius = cornerRadius
               self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
           } else {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.bottomLeft , .bottomRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
        }
    }
}
