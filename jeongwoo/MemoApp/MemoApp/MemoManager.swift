import SwiftUI
import SwiftData

class MemoManager {
    @Environment(\.modelContext) var modelContext
    @Query var memos: [Memo]
    
    func addMemo(_ text: String, color: Color) {
        let memo = Memo(text: text, color: color, created: Date())
        modelContext.insert(memo)
    }
    
    func removeMemo(_ targetMemo: Memo) {
        modelContext.delete(targetMemo)
    }
    
    func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
