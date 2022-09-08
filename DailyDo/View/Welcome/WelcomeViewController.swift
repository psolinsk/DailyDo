//
//  WelcomeViewController.swift
//  DailyDo
//
//  Created by Patryk Soliński on 26/03/2022.
//

import Foundation
import UIKit

class WelcomeViewController:UIViewController {
    
    override func viewDidLoad() {
/*        self.view.setGradientBackground(xStart: 0.5, yStart: 0.4, xEnd: 0.5, yEnd: 0.8) */
        self.view.setGredientBackground(colors: [UIColor.black.cgColor, Colors.orangeMain.cgColor], xStart: 0.5, yStart: 0.4, xEnd: 0.5, yEnd: 0.8)
    }
}
