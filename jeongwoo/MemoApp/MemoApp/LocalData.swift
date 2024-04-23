import SwiftUI
import SwiftData

@Model
class Memo {
    var id: UUID
    var text: String
    var color: String
    var created: Date
    
    
    init(id: UUID = UUID(),text: String, color: String, created: Date) {
        self.id = id
        self.text = text
        self.color = color
        self.created = created
    }
}
