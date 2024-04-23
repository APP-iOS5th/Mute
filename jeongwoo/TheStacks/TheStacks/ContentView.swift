import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("VStack Item 1")
            Text("VStack Item 2")
            Text("VStack Item 3")
        }
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
