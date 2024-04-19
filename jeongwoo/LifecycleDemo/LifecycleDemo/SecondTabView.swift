
import SwiftUI

struct SecondTabView: View {
    var body: some View {
        Text("View2")
            .onAppear(perform: {
                print("onApper")
            })
            .onDisappear(perform: {
                print("onDisapper")
            })
    }
}

#Preview {
    SecondTabView()
}
