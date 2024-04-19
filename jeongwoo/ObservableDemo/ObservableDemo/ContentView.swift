import SwiftUI

struct ContentView: View {
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: timerData.resetCount) {
                    Text("Reset Counter")
                }
                NavigationLink(destination: SecondView()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
        .environmentObject(timerData)
    }
    //    func resetCount() {
    //        timerData.resetCount()
    //    }
}

#Preview {
    ContentView()
}
