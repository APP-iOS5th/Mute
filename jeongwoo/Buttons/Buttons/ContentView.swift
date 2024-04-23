import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 44) {
                NavigationLink("Button") {
                    ButtonView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
