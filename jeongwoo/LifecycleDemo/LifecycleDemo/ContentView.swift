

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.corcle")
                    Text("First")
                }
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.corcle")
                    Text("Second")
                }
        }
    }
}

#Preview {
    ContentView()
}
