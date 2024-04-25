import Foundation

enum Priority: Int, Comparable {
    case low = 0
    case medium = 1
    case high = 2
    
    static func < (lhs: Priority, rhs: Priority) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct TaskModel: Identifiable, Comparable {
    var id = UUID()
    var completed: Bool
    var description: String
    var priority: Priority
    
    static func < (lhs: TaskModel, rhs: TaskModel) -> Bool {
        if lhs.priority != rhs.priority {
            return lhs.priority < rhs.priority
        } else {
            return !lhs.completed && rhs.completed
        }
    }
}

extension TaskModel {
    static var tasks = [
        TaskModel(completed: false, description: "Wake up", priority: .low ),
        TaskModel(completed: false, description: "Shower", priority: .medium),
        TaskModel(completed: true, description: "Code", priority: .high),
        TaskModel(completed: false, description: "Eat", priority: .high ),
        TaskModel(completed: false, description: "Sleep", priority: .high),
        TaskModel(completed: false, description: "Get groceries", priority: .high)
    ]
    mutating func toggleCompletion() {
            completed.toggle()
        }
}
