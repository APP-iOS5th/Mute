//
//  MemoApp.swift
//  Memo
//
//  Created by 박지혜 on 4/23/24.
//

import SwiftUI
import SwiftData

@main
struct MemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Memo.self)
        }
    }
}
