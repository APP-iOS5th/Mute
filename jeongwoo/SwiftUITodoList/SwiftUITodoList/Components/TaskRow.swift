import SwiftUI

struct TaskRow: View {
    @Binding var task: TaskModel 
    
    var body: some View {
        HStack {
            Button(action: {
                task.toggleCompletion()
            }) {
                Image(systemName: task.completed ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(task.completed ? .blue : .red)
            }
            Text(task.description)
                .strikethrough(task.completed)
            Spacer()
            Text(task.priority == .high ? "High" : task.priority == .medium ? "Medium" : "Low")
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
