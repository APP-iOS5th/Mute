import SwiftUI

struct ContentView: View {
    let CalulatorButton = [["7","8","9","/"], ["4","5","6","*"], ["1","2","3","-"], [".","0","C","+"],["="]]
    var body: some View {
        VStack {
            Text("result")
            ForEach(CalulatorButton, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { calbtn in
                        Button(action: {
                            print("button")
                        }) {
                            Text(calbtn)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
