//
//  Memo.swift
//  Memo
//
//  Created by 박지혜 on 4/23/24.
//

import Foundation
import SwiftData

@Model
class Memo: Identifiable {
    var id = UUID()
    var text: String
//    var color: Color
    var created: Date
    
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    
    init(text: String, /*color: Color,*/ created: Date) {
        self.text = text
//        self.color = color
        self.created = created
    }
}
