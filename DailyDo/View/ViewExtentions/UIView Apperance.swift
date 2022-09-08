//
//  UIView Apperance.swift
//  DailyDo
//
//  Created by Patryk Soliński on 12/08/2021.
//

import UIKit

extension UIView {
    
    func setGredientBackground(colors:[Any], xStart: Double, yStart: Double, xEnd: Double, yEnd: Double) {
        
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = self.bounds
                gradientLayer.colors = colors
        
        gradientLayer.startPoint = CGPoint(x: xStart, y: yStart)
        gradientLayer.endPoint = CGPoint(x: xEnd, y: yEnd)
        
        self.layer.addSublayer(gradientLayer)
    }
}
