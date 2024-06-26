import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: SecondView(someText: "Text passed from ContentView")) {
                Text("Go to second view")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(25)
            }
            .navigationTitle("Previews")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
