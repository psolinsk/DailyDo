//
//  UIView Apperance.swift
//  DailyDo
//
//  Created by Patryk Soliński on 12/08/2021.
//

import UIKit

extension UIView {
    
//    func setGradientBackground(xStart: Double, yStart: Double, xEnd: Double, yEnd: Double) {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [UIColor.black.cgColor, UIColor.systemOrange.cgColor]
//        gradientLayer.startPoint = CGPoint(x: xStart, y: yStart)
//        gradientLayer.endPoint = CGPoint(x: xEnd, y: yEnd)
//
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
    
    func setGredientBackground(colors:[Any], xStart: Double, yStart: Double, xEnd: Double, yEnd: Double) {
        
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = self.bounds
                gradientLayer.colors = colors
        
        gradientLayer.startPoint = CGPoint(x: xStart, y: yStart)
        gradientLayer.endPoint = CGPoint(x: xEnd, y: yEnd)
        
        self.layer.addSublayer(gradientLayer)
    }
}
