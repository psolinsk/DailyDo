//
//  Board.swift
//  DailyDo
//
//  Created by Patryk Soliński on 13/08/2021.
//

import Foundation

class Board: Codable {
    var title: String
    var items: [String]
    
    init(title: String, items: [String]) {
        self.title = title
        self.items = items
    }
}
