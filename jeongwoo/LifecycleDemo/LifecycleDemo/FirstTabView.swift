
import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Text("View1")
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappear triggered")
            })
    }
}

#Preview {
    FirstTabView()
}
