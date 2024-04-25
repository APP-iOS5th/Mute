import SwiftUI

struct TaskRow: View {
    var task: TaskModel
    
    var body: some View {
        HStack {
            if task.completed {
                Image(systemName: "largecircle.fill.circle")
                    .foregroundStyle(.blue)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.red)
            }
            Text(task.description)
            Spacer()
            Text(task.priority == .high ? "High" : task.priority == .medium ? "Medium" : "Low")
        }
        .padding()
    }
}


#Preview {
    TaskRow(task: TaskModel(completed: false, description: "Task Description", priority: .low))
}
