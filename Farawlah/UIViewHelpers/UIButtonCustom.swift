//
//  UIButtonCustom.swift
//  EV Quiz
//
//  Created by Anup Sukumaran on 03/10/18.
//  Copyright © 2018 WIS. All rights reserved.
//

import UIKit

@IBDesignable
class UIButtonCustom: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornurRadius: CGFloat = 1.0 {
        didSet {
            layer.cornerRadius = cornurRadius
            clipsToBounds = true
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0.0 {
        
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
   
        }
    }
 
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        
        didSet {
            layer.shadowRadius = shadowRadius
            
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero{
        
        didSet {
            layer.shadowOffset = shadowOffset
            
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
            
        }
    }
    
    @IBInspectable var maskToBounds: Bool = false {
        
        didSet {
            layer.masksToBounds = maskToBounds
            
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        configure()
    }
    
    func setup() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 1.0
    }
    
    func configure() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornurRadius
    }
}
