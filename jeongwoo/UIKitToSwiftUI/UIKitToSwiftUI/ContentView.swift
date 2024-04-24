import SwiftUI

struct ContentView: View {
    @State private var animate = true
    var body: some View {
        VStack {
            ActivityIndicator(animating: animate)
            ProgressView()
            HStack {
                Toggle(isOn: $animate) {
                    Text("Toggle Activity")
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
