//
//  UIView.swift
//  vendor
//
//  Created by Mahdi on 7/17/18.
//  Copyright © 2018 ZoodFood Mac. All rights reserved.
//


import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    func addLoader() {
        
        let parent = UIView(frame: self.bounds)
        parent.tag = 100
        parent.backgroundColor = UIColor.white
        
        let parentWidth  = parent.bounds.width
        let parentHeight = parent.bounds.height
        
        let loaderImageView = UIImageView(frame: CGRect(x: (parentWidth/2 - 52), y: (parentHeight/2 - 52), width: 104, height: 104))
        loaderImageView.image = UIImage(named: Constants.Image.loadLoading)
        
        let logoImageView = UIImageView(frame: CGRect(x: (parentWidth/2 - 50), y: (parentHeight/2 - 50), width: 100, height: 100))
        logoImageView.image = UIImage(named: Constants.Image.loadLogo)
        
        loaderImageView.rotate(duration: 1)
        
        parent.addSubview(loaderImageView)
        parent.addSubview(logoImageView)
        self.addSubview(parent)
        
    }
    
    func removeLoader() {
        
        if let viewWithTag = self.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
    
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
    
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
        
    
}

