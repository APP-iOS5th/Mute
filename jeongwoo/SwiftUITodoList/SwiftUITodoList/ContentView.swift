import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(TaskModel.tasks) { task in
                    TaskRow(task: task)
                }
            }
            .navigationTitle("To Do List")
        }
    }
}

#Preview {
    ContentView()
}
