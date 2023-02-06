//
//  UIView.swift
//  GBShop
//
//  Created by Оксана Каменчук on 03.02.2023.
//

import UIKit

extension UIView {
    
    enum GradientDirection {
        case topToBottom
        case bottomToTop
        case leftToRight
        case rightToLeft
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        self.layer.addSublayer(gradient)
        return gradient
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.addSublayer(gradient)
        return gradient
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor], gradientDirection: GradientDirection) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        switch gradientDirection {
        case .topToBottom:
            gradient.startPoint = CGPoint(x: 0.5, y: 0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1)
        case .bottomToTop:
            gradient.startPoint = CGPoint(x: 0.5, y: 1)
            gradient.endPoint = CGPoint(x: 0.5, y: 0)
        case .leftToRight:
            gradient.startPoint = CGPoint(x: 0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1, y: 0.5)
        case .rightToLeft:
            gradient.startPoint = CGPoint(x: 1, y: 0.5)
            gradient.endPoint = CGPoint(x: 0, y: 0.5)
        }
        
        self.layer.addSublayer(gradient)
        return gradient
    }
    
    func setOpacity() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 3.0
        self.layer.masksToBounds = false
    }
    func removeOpacity() {
        self.layer.shadowColor = .none
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = .zero
        self.layer.shadowRadius = .zero
        self.layer.masksToBounds = true
    }
}
