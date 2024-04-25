import Foundation

enum Priority: Comparable {
    case high
    case medium
    case low
}

struct TaskModel: Identifiable {
    var id = UUID()
    var completed: Bool
    var description: String
    var priority: Priority
    
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
    static var task = tasks[0]
}
