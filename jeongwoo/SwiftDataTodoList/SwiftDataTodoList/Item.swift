//
//  Item.swift
//  SwiftDataTodoList
//
//  Created by 김정우 on 4/25/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
