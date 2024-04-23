import SwiftUI

struct BackgroundStyle: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width * 0.3)
            .foregroundStyle(.black)
            .padding()
            .background(bgColor)
            .cornerRadius(20)
    }
}

extension View {
    func customBackgroundStyle(color: Color) -> some View {
        modifier(BackgroundStyle(bgColor: color))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Perfect").modifier(BackgroundStyle(bgColor: .green))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}