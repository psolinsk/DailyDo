//
//  UIView Apperance.swift
//  DailyDo
//
//  Created by Patryk Soliński on 12/08/2021.
//

import UIKit

extension UIView {
    
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.systemOrange.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.4)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.99)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
