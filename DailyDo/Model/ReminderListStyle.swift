//
//  ReminderListStyle.swift
//  DailyDo
//
//  Created by Patryk Soliński on 03/10/2022.
//

import Foundation
import EventKit

enum ReminderListStyle: Int {
    case today
    case future
    case all
    case allCompleted
    
    var name: String {
        switch self {
        case .today:
            return NSLocalizedString("Today", comment: "Today style name")
        case .future:
            return NSLocalizedString("Future", comment: "Future style name")
        case .all:
            return NSLocalizedString("All", comment: "All style name")
        case .allCompleted:
            return NSLocalizedString("Done", comment: "All by completed")
        }
    }
    
    func shouldInclude(date: Date, isComp: Bool) -> Bool {
        let isInToday = Locale.current.calendar.isDateInToday(date)
        switch self {
        case .today:
            return isInToday
        case .future:
            return (date > Date.now) && !isInToday
        case .all:
            return true
        case .allCompleted:
            return (isComp == true)
        }
    }
}
