//
//  WelcomeNavigationController.swift
//  DailyDo
//
//  Created by Patryk Soliński on 13/08/2021.
//

import Foundation
import UIKit

class WelcomeNavigationController:UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPurple]
         UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
    }
}
