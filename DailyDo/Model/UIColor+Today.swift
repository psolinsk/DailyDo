//
//  UIColor+Today.swift
//  DailyDo
//
//  Created by Patryk Soliński on 03/10/2022.
//

import UIKit

extension UIColor {
    static var todayDetailCellTint: UIColor {
        UIColor(named: "TodayDetailCellTint") ?? UIColor.orange//.tintColor
    }
    
    static var todayListCellBackground: UIColor {
        UIColor(named: "TodayListCellBackground") ?? .secondarySystemBackground
    }
    
    static var todayListCellDoneButtonTint: UIColor {
        UIColor(named: "TodayListCellDoneButtonTint") ?? UIColor.orange//.tintColor
    }
    
    static var todayGradientAllBegin: UIColor {
        UIColor(named: "TodayGradientAllBegin") ?? UIColor.black//.systemFill
    }
    
    static var todayGradientAllEnd: UIColor {
        UIColor(named: "TodayGradientAllEnd") ?? UIColor.systemBlue//.quaternarySystemFill
    }
    
    static var todayGradientFutureBegin: UIColor {
        UIColor(named: "TodayGradientFutureBegin") ?? UIColor.black//.systemFill
    }
    
    static var todayGradientFutureEnd: UIColor {
        UIColor(named: "TodayGradientFutureEnd") ?? UIColor.systemPurple//.quaternarySystemFill
    }
    
    static var todayGradientTodayBegin: UIColor {
        UIColor(named: "TodayGradientTodayBegin") ?? UIColor.black//.systemFill
    }
    
    static var todayGradientTodayEnd: UIColor {
        UIColor(named: "TodayGradientTodayEnd") ?? .quaternarySystemFill // MARK: END COLOR
    }
    
    static var todayNavigationBackground: UIColor {
        UIColor(named: "TodayNavigationBackground") ?? UIColor.orange//.secondarySystemBackground
    }
    
    static var todayPrimaryTint: UIColor {
        UIColor(named: "TodayPrimaryTint") ?? UIColor.orange//.tintColor
    }
    
    static var todayProgressLowerBackground: UIColor {
        UIColor(named: "TodayProgressLowerBackground") ?? UIColor.purple//.systemGray
    }
    
    static var todayProgressUpperBackground: UIColor {
        UIColor(named: "TodayProgressUpperBackground") ?? .systemGray6
    }
}


