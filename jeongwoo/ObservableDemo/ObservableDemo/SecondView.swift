import SwiftUI

struct SecondView: View {
    @StateObject var timerData: TimerData
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
            
        }
    }
}

#Preview {
    SecondView(timerData: TimerData())
}
