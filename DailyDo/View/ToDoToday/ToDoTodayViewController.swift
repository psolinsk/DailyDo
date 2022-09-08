//
//  ToDoTodayViewController.swift
//  DailyDo
//
//  Created by Patryk Soliński on 26/03/2022.
//

import Foundation
import UIKit

class ToDoTodayViewController:UIViewController {
    
    override func viewDidLoad() {
        self.view.setGredientBackground(colors: [UIColor.black.cgColor, Colors.ToDoPurple.cgColor], xStart: 0.5, yStart: 0.4, xEnd: 0.5, yEnd: 0.8)
    }
}
