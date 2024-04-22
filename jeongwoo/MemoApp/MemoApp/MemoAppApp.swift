import SwiftUI
import SwiftData

@main
struct MemoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self)
        }
    }
}
