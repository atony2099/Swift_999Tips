//
//  ShakeAble.swift
//  protocol-oriented
//
//  Created by admin on 13/01/2018.
//  Copyright © 2018 atony. All rights reserved.
//

import UIKit


protocol Shakeable {}


extension Shakeable where Self:UIView  {
    func shake()  {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint:CGPoint(x: self.center.x - 4, y: self.center.y))
        animation.toValue = NSValue(cgPoint:CGPoint(x: self.center.x + 4, y: self.center.y))
        layer.add(animation, forKey: "position")
    }

}

