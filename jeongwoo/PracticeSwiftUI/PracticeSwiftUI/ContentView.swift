import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                doSomething()
            }) {
                Text("Do somthing")
            }
        }
    }
    func doSomething() {
        print("start \(Date())")
        Task {
            // let result = await takesTooLong()
            // print("DAte result: \(result)")
            async let result = takesTooLong()
            print("Date result: \(await result)")
        }
        print("End \(Date())")
    }
    
    func takesTooLong() async -> Date{
        sleep(5)
        print("Async task completed at \(Date())")
        return Date()
    }
}

#Preview {
    ContentView()
}
