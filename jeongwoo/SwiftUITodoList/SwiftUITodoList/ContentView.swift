import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(TaskModel.tasks) { task in
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
            .navigationTitle("To Do List")
        }
    }
}

#Preview {
    ContentView()
}
