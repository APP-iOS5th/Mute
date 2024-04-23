//
//  ContentView.swift
//  Memo
//
//  Created by 박지혜 on 4/23/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var isSheetShowing: Bool = false
    
    @Environment(\.modelContext) var modelContext
    // 메모의 텍스트 정렬(오름차순)
//    @Query(sort: [SortDescriptor(\Memo.text, order: .forward)]) var memos: [Memo]
    // 메모 만든 날짜순 정렬(오름차순(기본)
//    @Query(sort: \Memo.created) var memos: [Memo]
    @Query var memos: [Memo]
    
    var body: some View {
        NavigationStack {
            List(memos) { memo in
                // TODO: list item
                HStack {
                    VStack {
                        Text("\(memo.text)")
                            .font(.title)
                        Text("\(memo.createdString)")
                            .font(.body)
                            .padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                // 꾹 눌렀을 때
                .contextMenu {
                    // 공유 기능
                    ShareLink(item: memo.text)
                    Button {
                        // TODO: remove Memo
                        modelContext.delete(memo)
                    } label: {
                        Image(systemName: "trash")
                        Text("삭제")
                    }
                }
                //                Spacer()
            }
            .listStyle(.plain)
            .navigationTitle("memo")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {
                        // TODO: 메모 추가 액션
                        isSheetShowing = true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView(isSheetShowing: $isSheetShowing)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Memo.self, inMemory: true) // 매모리 내에서 처리함을 명시적으로 나타냄(안써도 정상작동)
}
