import SwiftUI

struct TaskRow: View {
    @State var task: TaskModel
    
    var body: some View {
        HStack {
            Button(action: {
                task.toggleCompletion()
            }) {
                Image(systemName: task.completed ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(task.completed ? .blue : .red)
            }
            Spacer()
            Text(task.completed ? task.description : task.description)
                .strikethrough(task.completed)
            Spacer()
            Text(task.priority == .high ? "High" : task.priority == .medium ? "Medium" : "Low")
        }
        .padding()
    }
}


#Preview {
    TaskRow(task: TaskModel(completed: false, description: "Task Description", priority: .low))
}
