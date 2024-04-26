
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.teal
                .frame(width: 200, height: 150)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Hell")
                    .font(.title2)
            }
            .foregroundStyle(.primary)
            .padding()
            .background()
            .border(.tertiary, width: 10)
        }
    }
}

#Preview {
    ContentView()
}

#Preview("Landscape", traits: .landscapeLeft) {
    ContentView()
}

#Preview("Upside down", traits: .portraitUpsideDown) {
    ContentView()
}

#Preview("Size that fits", traits: .sizeThatFitsLayout) {
    ContentView()
}

#Preview("Fixed", traits: .fixedLayout(width: 500, height: 200)) {
    ContentView()
}
