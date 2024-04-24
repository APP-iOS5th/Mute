import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1...10000, id:\.self) { item in
                        ListRow(id: item, type: "hr")
                    }
                }
            }
            .frame(height: 100, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
