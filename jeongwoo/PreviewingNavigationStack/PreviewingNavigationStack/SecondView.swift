import SwiftUI

struct SecondView: View {
    var someText: String = "This is the second view"
    var body: some View {
        Text(someText)
            .navigationTitle("SecondView")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("SecondView") {
    NavigationStack {
        SecondView()        
    }
}
