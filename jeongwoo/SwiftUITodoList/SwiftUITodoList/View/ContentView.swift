import SwiftUI

struct ContentView: View {
    @State var tasks = TaskModel.tasks 
    
    var body: some View {
        NavigationView {
            List {
                ForEach($tasks) { $task in
                    TaskRow(task: $task)
                }
            }
            .navigationTitle("To Do List")
        }
    }
}

#Preview {
    ContentView()
}
